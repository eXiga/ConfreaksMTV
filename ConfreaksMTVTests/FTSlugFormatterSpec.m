//
//  FTSlugFormatterSpec.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/25/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTSlugFormatter.h"

SpecBegin(FTSlugFormatter)

describe(@"FTSlugFormatter", ^{
    __block FTSlugFormatter *slugFormatter;
    __block NSMutableString *inputString1;
    __block NSString *inputString2;
    __block NSString *outputString;
    
    beforeAll(^{
        inputString1 = [[NSMutableString alloc] initWithString:@"Ronald M.C.Donald"];
        inputString2 = @"Dima Kostenich";
    });
    
    beforeEach(^{
        slugFormatter = [[FTSlugFormatter alloc] initWithSymbolsToReplace:@[@" ", @"."] withSymbol:@"-"];
    });
    
    it(@"is expected to correctly replace symbols in string if input parameter is NSMutableString", ^{
        outputString = [slugFormatter stringForObjectValue:inputString1];
        expect(outputString).to.equal(@"Ronald-M-C-Donald");
        outputString = [slugFormatter stringForObjectValue:@"Dima Kostenich"];
        expect(outputString).to.equal(@"Dima-Kostenich");
    });

    it(@"is expected to correctly replace symbols in string if input parameter is NSString", ^{
        outputString = [slugFormatter stringForObjectValue:inputString2];
        expect(outputString).to.equal(@"Dima-Kostenich");

    });
    
});

SpecEnd
