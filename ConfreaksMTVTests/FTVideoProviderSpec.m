//
//  FTVideoProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTVideoProvider.h"
#import "FTBaseProvider.h"

SpecBegin(FTVideoProvider)

describe(@"FTVideoProvider", ^{
    __block FTVideoProvider *provider = nil;
    
    beforeEach(^{
        provider = [FTVideoProvider new];
    });
    
    it(@"is expected to be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
    
    it(@"is expected to have valid resource url: https://confreaks.tv/api/v1/videos", ^{
        NSURL *resultUrl = [NSURL URLWithString:VideosEndpointName relativeToURL:[provider baseUrl]];
        expect(provider.url).to.equal(resultUrl);
    });
    
    describe(@"#getAllEntitiesWithCompletionHandler:", ^{
        context(@"without parameters", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"videos"];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(videos_all)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get all videos from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesWithCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(10);
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
        
        context(@"with limit", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"videos"] &&
                            request.URL.query != nil;
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(videos_limited)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get limited videos from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesUsingLimit:@5 orderedByDescending:NO withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(5);
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
        
        context(@"with ordereing by desc", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"videos"] &&
                            request.URL.query != nil;
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(videos_sorted)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get sorted videos from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesUsingLimit:@4 orderedByDescending:YES withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(4);
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
    });
    
    describe(@"#getVideosCountWithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"video_count"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(video_count)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"is expected to get videos count from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getVideoCountWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).toNot.beNil();
                    done();
                }];
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });

    });
    
    describe(@"#getFeaturedVideoWithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"featured-video"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(video_featured)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"is expected to get featured video from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getFeaturedVideoWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).toNot.beNil();
                    done();
                }];
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
    
    describe(@"#getEntityForId:WithCompletionHandler", ^{
        context(@"when working with slug", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return ([request.URL.lastPathComponent isEqualToString:@"rubyconf2007-essential-incompleteness-in-program-modeling"]);
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(video)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get one video from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@"rubyconf2007-essential-incompleteness-in-program-modeling" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).toNot.beNil();
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
        
        context(@"when working with id", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return ([request.URL.lastPathComponent isEqualToString:@"42"]);
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(video)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get one video from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@42 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).toNot.beNil();
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
    });
    
    describe(@"#getVideosForPresenter:WithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return ([request.URL.lastPathComponent isEqualToString:@"videos"]);
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(videos_for_at)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        context(@"when working with id", ^{
            it(@"is expected to get all videos for presenter at event from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForPresenter:@23 atEvent:@9 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).toNot.beNil();
                        done();
                    }];
                });
            });
        });
        
        context(@"when working with shortcode", ^{
            it(@"is expected to get all videos for presenter at event from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForPresenter:@"aaron-bedra" atEvent:@"rubyconf2007" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).toNot.beNil();
                        done();
                    }];
                });
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });

    
});

SpecEnd
