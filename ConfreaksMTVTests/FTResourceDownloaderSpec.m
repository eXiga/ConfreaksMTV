//
//  FTResourceDownloaderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 18.10.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTResourceDownloader.h"

SpecBegin(FTResourceDownloader)

describe(@"FTResourceDownloader", ^{
    __block NSURLRequest *request = nil;
    
    beforeEach(^{
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"www.google.com"]];
        
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest * request) {
            return YES;
        } withStubResponse:^OHHTTPStubsResponse* (NSURLRequest * request) {
            return [OHHTTPStubsResponse responseWithFileAtPath:FIXTURE(downloader)
                                                    statusCode:200
                                                       headers:@{@"Content-Type":@"application/json"}];
        }];
    });
    
    it(@"should make valid get request", ^{
        waitUntil(^(DoneCallback done) {
            [FTResourceDownloader getRequest:request withHandler:^(id object, NSError * error) {
                expect(object[@"ping"]).to.equal(@"pong");
                done();
            }];
        });
    });
    
    afterEach(^{
        [OHHTTPStubs removeAllStubs];
    });
});

SpecEnd
