//
//  FTSlugFormatter.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/25/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTSlugFormatter.h"

@implementation FTSlugFormatter

- (instancetype)initWithSymbolsToReplace:(NSArray *)symbolsToReplace withSymbol:(NSString *)symbolToReplaceWith{
    self = [super init];
    
    if (self) {
        _symbolsToReplace = symbolsToReplace;
        _symbolToReplaceWith = symbolToReplaceWith;
    }
    
    return self;
}

- (NSString *)stringForObjectValue:(id)obj {
    if (![obj isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSMutableString *newSlug = [obj mutableCopy];
    
    for (NSString *symbolToReplace in _symbolsToReplace) {
        [newSlug replaceOccurrencesOfString:symbolToReplace withString:_symbolToReplaceWith options:NSLiteralSearch range:NSMakeRange(0, [newSlug length])];
    }
    
    return (NSString *)newSlug;
}

@end
