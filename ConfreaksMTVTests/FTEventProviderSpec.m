//
//  FTEventProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTEventProvider.h"
#import "FTBaseProvider.h"
#import "FTEvent.h"


SpecBegin(FTEventProvider)

describe(@"FTEventProvider", ^{
    __block FTEventProvider *provider;
    
    beforeEach(^{
        provider = [FTEventProvider new];
    });
    
    it(@"is expected to be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
    
    it(@"is expected to have valid resource url: https://confreaks.tv/api/v1/events", ^{
        NSURL *resultUrl = [NSURL URLWithString:EventsEndpointName relativeToURL:[provider baseUrl]];
        expect(provider.url).to.equal(resultUrl);
    });
    
    describe(@"#getAllEntitiesWithCompletionHandler:", ^{
        context(@"without parameters", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"events"];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(events)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesWithCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get all event from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesWithCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(5);
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
                    return [request.URL.lastPathComponent isEqualToString:@"events"] &&
                    request.URL.query != nil;
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(events_limited)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesUsingLimit:@6 orderedByDescending:NO withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get limited events from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesUsingLimit:@6 orderedByDescending:NO withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(6);
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
        
        context(@"with ordering by descending", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"events"] &&
                    request.URL.query != nil;
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(events_sorted)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesUsingLimit:@5 orderedByDescending:YES withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });

            it(@"is expected to get sorted events from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getAllEntitiesUsingLimit:@5 orderedByDescending:YES withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(5);
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
    });
    
    describe(@"#getEntityForId:WithCompletionHandler:", ^{
        context(@"when working with shortcode", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return ([request.URL.lastPathComponent isEqualToString:@"g5thrive"]);
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(event)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@"g5thrive" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get one event from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@"g5thrive" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(1);
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
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(event)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@42 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get one event from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@42 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(1);
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
    });
    
    describe(@"#getVideosForEvent:WithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return ([request.URL.lastPathComponent isEqualToString:@"videos"]);
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(event_videos)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        context(@"when working with id", ^{
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForEvent:@42 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });

            it(@"is expected to get all event's videos", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForEvent:@42 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(5);
                        done();
                    }];
                });
            });
        });
        
        context(@"when working with shortcode", ^{
            it(@"is expected to return an array of FTEvent", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForEvent:@"g5thrive" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTEvent class]);
                        done();
                    }];
                });
            });

            it(@"is expected to get all event's videos", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForEvent:@"g5thrive" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.haveACountOf(5);
                        done();
                    }];
                });
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
    
    describe(@"#getEventCountWithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"event_count"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(event_count)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"is expected to return an array of FTEvent", ^{
            waitUntil(^(DoneCallback done) {
                [provider getEventCountWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).to.beAKindOf([NSArray class]);
                    expect([object firstObject]).to.beAKindOf([FTEvent class]);
                    done();
                }];
            });
        });
        
        it(@"is expected to get events count from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getEventCountWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).to.haveACountOf(1);
                    done();
                }];
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
});

SpecEnd
