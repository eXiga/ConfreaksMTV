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
    
    it(@"should have endpoint property equal to conferences", ^{
        expect(provider.endpointName).to.equal(@"conferences");
    });
    
    context(@"when it's working with resources", ^{
        beforeEach(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.pathComponents containsObject:@"conferences.json"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                NSString *fixturePath = OHPathForFileInBundle(@"conferences.json", OHResourceBundle(@"Fixtures", self.class));
                return [OHHTTPStubsResponse responseWithFileAtPath:fixturePath
                                                        statusCode:200
                                                           headers:@{@"Content-Type":@"application/json"}];
            }];
        });
        
        it(@"should get all conferences from service", ^{
            waitUntil(^(DoneCallback done) {
                [provider getAllEntitiesWithCompletionHandler:^(id object, NSError *error) {
                    expect(object).to.haveACountOf(3);
                    done ();
                }];
            });
        });
        
        afterEach(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
});

SpecEnd
