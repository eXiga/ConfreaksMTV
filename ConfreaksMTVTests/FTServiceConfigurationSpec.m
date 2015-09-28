//
//  FTServiceConfigurationSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTServiceConfiguration.h"


SpecBegin(FTServiceConfiguration)

describe(@"FTServiceConfiguration", ^{
    __block FTServiceConfiguration *configuration = nil;
    
    beforeEach(^{
        configuration = [FTServiceConfiguration new];
    });
    
    it(@"should return api url", ^{
        expect([configuration apiURL]).to.beInstanceOf([NSURL class]);
    });
    
    // Yep, I know it's ugly and weird to have several expectations in one test,
    // but I don't want to separate this test in 4-5 tests
    it(@"should return valid api url", ^{
        NSURL *url = [configuration apiURL];
        NSArray<NSString *> *urlComponents = url.pathComponents;
        expect(url.host).to.equal(@"confreaks.tv");
        expect(urlComponents).to.haveACountOf(3);
        expect(urlComponents).to.contain(@"api");
        expect(urlComponents).to.contain(@"v1");
        expect(urlComponents).to.contain(@"/");

    });
});

SpecEnd
