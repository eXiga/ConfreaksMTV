//
//  FTConferenceProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTConferenceProvider.h"
#import "FTBaseProvider.h"

SpecBegin(FTConferenceProvider)

describe(@"FTConferenceProvider", ^{
    __block FTConferenceProvider *provider = nil;
    
    beforeEach(^{
        provider = [FTConferenceProvider new];
    });
    
    it(@"is expected to be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
    
    it(@"is expected to have valid resource url: https://confreaks.tv/api/v1/conferences", ^{
        NSURL *baseUrl = [NSURL URLWithString:[[[NSBundle mainBundle] infoDictionary] objectForKey:BaseApiURL]];
        NSURL *resultUrl = [NSURL URLWithString:ConferencesEndpointName relativeToURL:baseUrl];
        expect(provider.url).to.equal(resultUrl);
    });
    
    describe(@"#getAllEntitiesWithCompletionHandler:", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"conferences"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(conferences)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"is expected to get all conferences from service", ^{
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
    
    describe(@"#getEntityForId:WithCompletionHandler:", ^{
        context(@"when working with id", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"aloha-ruby"];
                } withStubResponse:^OHHTTPStubsResponse * (NSURLRequest * request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(conference)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get one conference from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@"aloha-ruby" withCompletionHandler:^(id object, NSError *error) {
                        expect(object).toNot.beNil();
                        done();
                    }];
                });
            });
            
            afterEach(^{
                [OHHTTPStubs removeAllStubs];
            });
        });
        
        context(@"when working with name", ^{
            beforeEach(^{
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return [request.URL.lastPathComponent isEqualToString:@"38"];
                } withStubResponse:^OHHTTPStubsResponse * (NSURLRequest * request) {
                    return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(conference)
                                                            statusCode:SUCCESS_STATUS_CODE
                                                               headers:DEFAULT_HEADERS];
                }];
            });
            
            it(@"is expected to get one conference from service", ^{
                waitUntil(^(DoneCallback done) {
                    [provider getEntityForId:@38 withCompletionHandler:^(id object, NSError *error) {
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
});

SpecEnd
