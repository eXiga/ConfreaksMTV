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

SpecBegin(FTEventProvider)

describe(@"FTEventProvider", ^{
    __block FTEventProvider *provider;
    
    beforeEach(^{
        provider = [FTEventProvider new];
    });
    
    it(@"should be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
    
    it(@"should have valid resource url: https://confreaks.tv/api/v1/events", ^{
        NSURL *baseUrl = [NSURL URLWithString:[[[NSBundle mainBundle] infoDictionary] objectForKey:BaseApiURL]];
        NSURL *resultUrl = [NSURL URLWithString:EventsEndpointName relativeToURL:baseUrl];
        expect(provider.url).to.equal(resultUrl);
    });
    
    context(@"when it's working with all events", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"events"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(events)
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
    
    context(@"when it's working with one event", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return ([request.URL.lastPathComponent isEqualToString:@"42"] ||
                        [request.URL.lastPathComponent isEqualToString:@"videos"]);
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:[request.URL.lastPathComponent isEqualToString:@"42"] ? FIXTURE(event) : FIXTURE(event_videos)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"should get one conference from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getEntityForId:@42 withCompletionHandler:^(id object, NSError *error) {
                    expect(object).toNot.beNil();
                    done();
                }];
            });
        });
        
        it(@"should get all event's videos", ^{
            waitUntil(^(DoneCallback done) {
                [provider getVideosForEvent:@42 withCompletionHandler:^(id object, NSError *error) {
                    expect(object).to.haveACountOf(5);
                    done();
                }];
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
    
    context(@"when it's fetching events count", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.lastPathComponent isEqualToString:@"event_count"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(event_count)
                                                        statusCode:SUCCESS_STATUS_CODE
                                                           headers:DEFAULT_HEADERS];
            }];
        });
        
        it(@"should return event count from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getEventCount:^(id object, NSError *error) {
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
