//
//  FTBaseProviderSpec.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTBaseProvider.h"


SpecBegin(FTBaseProvider)

describe(@"FTBaseProvider", ^{
    __block FTBaseProvider *provider;
    
    beforeEach(^{
        provider = [[FTBaseProvider alloc] initWithEndpointName:@"endpoint"];
    });
    
    it(@"should conforms to DataProvider protocol", ^{
        expect([provider conformsToProtocol:@protocol(DataProvider)]).to.beTruthy();
    });
    
    it(@"should have endpoint name", ^{
        expect(provider.endpointName).notTo.beNil();
    });
    
    it(@"should raise NotImplemented exception for getAll method", ^{
        expect(^{
            [provider getAllEntitiesWithCompletionHandler:^(id object, NSError * error) {
                
            }];
        }).to.raise(@"NotImplementedException");
    });
    
    it(@"should raise NotImplemented excpetion for getOne method", ^{
        expect(^{
            [provider getEntityForId:[NSNumber numberWithInt:1] withCompletionHandler:^(id object, NSError * error) {
                
            }];
        }).to.raise(@"NotImplementedException");
    });
});

SpecEnd
