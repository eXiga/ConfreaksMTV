//
//  FTVideoProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTVideoProvider.h"
#import "FTBaseProvider.h"

SpecBegin(FTVideoProvider)

describe(@"FTVideoProvider", ^{
    __block FTVideoProvider *provider = nil;
    
    beforeEach(^{
        provider = [FTVideoProvider new];
    });
    
    it(@"should be a subclass of FTBaseProvider", ^{
        expect([provider class]).to.beSubclassOf([FTBaseProvider class]);
    });
});

SpecEnd
