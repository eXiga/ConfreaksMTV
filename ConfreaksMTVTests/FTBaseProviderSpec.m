//
//  FTBaseProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTBaseProvider.h"
#import "FTResourceDownloader.h"

SpecBegin(FTBaseProvider)

describe(@"FTBaseProvider", ^{
    __block FTBaseProvider *provider;
    
    beforeEach(^{
        provider = [[FTBaseProvider alloc] initWithEndpointName:@"endpoint"];
    });
    
    it(@"is expected to conform to DataProvider protocol", ^{
        expect([provider conformsToProtocol:@protocol(DataProvider)]).to.beTruthy();
    });
    
    it(@"is expected to have valid resource url", ^{
        expect(provider.url).notTo.beNil();
    });
    
    it(@"is expected to get valid api url from bundle", ^{
        NSString *apiString = [[provider baseUrl] absoluteString];
        expect(apiString).to.equal(@"https://confreaks.tv/api/v1/");
    });
});

SpecEnd
