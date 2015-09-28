//
//  FTEventProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTEventProvider.h"
#import "DataProvider.h"

SpecBegin(FTEventProvider)

describe(@"FTEventProvider", ^{
    __block FTEventProvider *provider;
    
    beforeEach(^{
        provider = [FTEventProvider new];
    });
    
    it(@"should conforms to DataProvider protocol", ^{
        expect([provider conformsToProtocol:@protocol(DataProvider)]).to.beTruthy();
    });  
});

SpecEnd
