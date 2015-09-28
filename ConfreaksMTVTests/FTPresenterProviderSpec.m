//
//  FTPresenterProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTPresenterProvider.h"
#import "DataProvider.h"

SpecBegin(FTPresenterProvider)

describe(@"FTPresenterProvider", ^{
    __block FTPresenterProvider *provider = nil;
    
    beforeEach(^{
        provider = [FTPresenterProvider new];
    });
    
    it(@"should conforms to DataProvider protocol", ^{
        expect([provider conformsToProtocol:@protocol(DataProvider)]).to.beTruthy();
    });
});

SpecEnd
