//
//  FTPresenterProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTPresenterProvider.h"
#import "FTBaseProvider.h"
#import "FTPresenter.h"

SpecBegin(FTPresenterProvider)

describe(@"FTPresenterProvider", ^{
    __block FTPresenterProvider *provider = nil;
    
    beforeEach(^{
        provider = [FTPresenterProvider new];
    });
    
    it(@"is expected to be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
    
    it(@"is expected to have valid resource url: https://confreaks.tv/api/v1/presenters", ^{
        NSURL *resultUrl = [NSURL URLWithString:PresentersEndpointName relativeToURL:[provider baseUrl]];
        expect(provider.url).to.equal(resultUrl);
    });
    
    describe(@"#getAllEntitiesWithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"presenters"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(presenters)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"is expected to return an array of FTPresenter", ^{
            waitUntil(^(DoneCallback done) {
                [provider getAllEntitiesWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).to.beAKindOf([NSArray class]);
                    expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                    done();
                }];
            });
        });
        
        it(@"is expected to get all presenters from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getAllEntitiesWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).to.beAKindOf([NSArray class]);
                    expect(object).to.haveACountOf(5);
                    expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                    done();
                }];
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
    
    describe(@"#getEntityForId:withCompletionHandler:", ^{
        context(@"when working with name", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"aaron-bedra"];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(presenter)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTPresenter", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@"aaron-bedra" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get one presenter from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@"aaron-bedra" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect(object).to.haveACountOf(1);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
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
                    return [request.URL.lastPathComponent isEqualToString:@"22"];
                } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(presenter)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to return an array of FTPresenter", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@22 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get one presenter from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@22 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect(object).to.haveACountOf(1);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                        done();
                    }];
                });
            });

            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
    });
    
    describe(@"getVideosForPresenter:withCompletionHandler", ^{
        beforeEach(^{
            [OHHTTPStubs removeAllStubs];
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"videos"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(presenter_videos)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        context(@"when working with id", ^{
            it(@"is expected to return an array of FTPresenter", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForPresenter:@22 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get all presenter's videos", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForPresenter:@22 withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect(object).to.haveACountOf(3);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                        done();
                    }];
                });
            });
        });
        
        context(@"when working with name", ^{
            it(@"is expected to return an array of FTPresenter", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForPresenter:@"aaron-bedra" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
                        done();
                    }];
                });
            });
            
            it(@"is expected to get all presenter's videos", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getVideosForPresenter:@"aaron-bedra" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).to.beAKindOf([NSArray class]);
                        expect(object).to.haveACountOf(3);
                        expect([object firstObject]).to.beAKindOf([FTPresenter class]);
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
