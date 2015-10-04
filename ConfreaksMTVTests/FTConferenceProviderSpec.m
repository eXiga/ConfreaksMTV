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
});

SpecEnd
