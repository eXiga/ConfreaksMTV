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
    
    it(@"should be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
    
    it(@"should have valid resource url: https://confreaks.tv/api/v1/conferences", ^{
        NSURL *baseUrl = [NSURL URLWithString:[[[NSBundle mainBundle] infoDictionary] objectForKey:BaseApiURL]];
        NSURL *resultUrl = [NSURL URLWithString:ConferencesEndpointName relativeToURL:baseUrl];
        expect(provider.url).to.equal(resultUrl);
    });
    
    context(@"when it's working with all conferences", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"conferences"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(conferences)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"should get all conferences from service", ^{
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
    
    context(@"when it's working with one conference", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"aloha-ruby"];
            } withStubResponse:^OHHTTPStubsResponse * (NSURLRequest * request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(conference)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"should get one conference for name from service", ^{
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
});

SpecEnd
