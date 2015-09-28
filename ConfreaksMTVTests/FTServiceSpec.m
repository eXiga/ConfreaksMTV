//
//  FTServiceSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTService.h"


SpecBegin(FTService)

describe(@"FTService", ^{
    __block FTService *service = nil;
    
    beforeAll(^{
        service = [FTService sharedInstance];
    });
    
    it(@"should have only once instance while working", ^{
        FTService *checkService = [FTService sharedInstance];
        expect(checkService).to.equal(service);
    });
    
    it(@"should contain conference provider", ^{
        expect(service.conferenceProvider).notTo.beNil();
    });
    
    it(@"should contain events provider", ^{
        expect(service.eventProvider).notTo.beNil();
    });
    
    it(@"should contain video provider", ^{
        expect(service.videoProvider).notTo.beNil();
    });
    
    it(@"should contain presenter provider", ^{
        expect(service.presenterProvider).notTo.beNil();
    });
});

SpecEnd
