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
    __block NSMutableString *inputString;
    __block NSString *outputString;
    
    beforeAll(^{
        inputString = [[NSMutableString alloc] initWithString:@"Ronald M.C.Donald"];
    });
    
    beforeEach(^{
        slugFormatter = [[FTSlugFormatter alloc] initWithSymbolsToReplace:@[@" ", @"."] withSymbol:@"-"];
    });
    
    it(@"is expected to correctly replace symbols in string", ^{
        outputString = [slugFormatter stringForObjectValue:inputString];
        expect(outputString).to.equal(@"Ronald-M-C-Donald");
        outputString = [slugFormatter stringForObjectValue:@"Dima Kostenich"];
        expect(outputString).to.equal(@"Dima-Kostenich");
    });
});

SpecEnd
