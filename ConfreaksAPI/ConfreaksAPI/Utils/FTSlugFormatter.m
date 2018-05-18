//
//  FTSlugFormatter.m
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
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
