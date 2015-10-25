//
//  FTVideo.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTVideo.h"
#import "FTSlugFormatter.h"

@implementation FTVideo

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    
    if (self) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
        
        _videoId = params[@"id"];
        _slug = params[@"slug"];
        _title = params[@"title"];
        _image = params[@"image"];
        
        if ([params[@"recorded_at"] class] != [NSNull class]) {
            _recordedAt = [dateFormatter dateFromString:params[@"recorded_at"]];
        }
        
        _event = params[@"event"];
        _rating = params[@"rating"];
        _abstract = params[@"abstract"];
        
        if ([params[@"post_date"] class] != [NSNull class]) {
            _postDate = [dateFormatter dateFromString:params[@"post_date"]];
        }
        
        if ([params[@"announce_date"] class] != [NSNull class]) {
            _announceDate = [dateFormatter dateFromString:params[@"announce_date"]];
        }
        
        _host = params[@"host"];
        _embedCode = params[@"embed_code"];
        _views = params[@"views"];
        _viewsLast7 = params[@"views_last_7"];
        _viewsLast30 = params[@"views_last_30"];
        _license = params[@"license"];
        _attribution = params[@"attribution"];
        
        if (params[@"presenters"] != nil) {
            NSArray *presenters = params[@"presenters"];
            _presentersSlug = [NSMutableArray new];
            
            for (NSDictionary *presenter in presenters) {
                if ([presenter[@"aka_name"] class] != [NSNull class] && [presenter[@"aka_name"] length] != 0) {
                    [_presentersSlug addObject:presenter[@"aka_name"]];
                } else {
                    FTSlugFormatter *slugFormatter = [[FTSlugFormatter alloc] initWithSymbolsToReplace:@[@" ", @"."] withSymbol:@"-"];
                    NSMutableString *newSlug = [[NSMutableString alloc] initWithString:presenter[@"first_name"]];
                    if ([newSlug characterAtIndex:MAX([newSlug length] - 1, 0)] != '.') {
                        [newSlug appendString:@" "];
                    }
                    [newSlug appendString:presenter[@"last_name"]];
                    
                    [_presentersSlug addObject:[slugFormatter stringForObjectValue:newSlug]];
                }
            }
        }
    }
    
    return self;
}

@end
