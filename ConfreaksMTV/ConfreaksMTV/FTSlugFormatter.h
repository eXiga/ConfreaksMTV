//
//  FTSlugFormatter.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/25/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTSlugFormatter : NSFormatter

@property (strong, nonatomic) NSArray *symbolsToReplace;
@property (strong, nonatomic) NSString *symbolToReplaceWith;

- (instancetype)initWithSymbolsToReplace:(NSArray *)symbols withSymbol:(NSString *)symbolToReplaceWith;

@end
