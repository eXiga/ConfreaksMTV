//
//  FTSlugFormatter.h
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTSlugFormatter : NSFormatter

@property (strong, nonatomic) NSArray *symbolsToReplace;
@property (strong, nonatomic) NSString *symbolToReplaceWith;

- (instancetype)initWithSymbolsToReplace:(NSArray *)symbols withSymbol:(NSString *)symbolToReplaceWith;

@end
