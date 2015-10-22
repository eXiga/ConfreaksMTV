//
//  FTVideo.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTVideo.h"

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
        _recordedAt = [dateFormatter dateFromString:params[@"recorded_at"]];
        _event = params[@"event"];
        _rating = params[@"rating"];
        _abstract = params[@"abstract"];
        _postDate = [dateFormatter dateFromString:params[@"post_date"]];
        _announceDate = [dateFormatter dateFromString:params[@"announce_date"]];
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
                if (presenter[@"aka_name"] != nil) {
                    [_presentersSlug addObject:presenter[@"aka_name"]];
                } else {
                    NSMutableString *newSlug = presenter[@"first_name"];
                    [newSlug appendString:@"-"];
                    [newSlug appendString:presenter[@"last_name"]];
                    [newSlug replaceOccurrencesOfString:@" " withString:@"-" options:NSLiteralSearch range:NSMakeRange(0, [newSlug length])];
                    [newSlug replaceOccurrencesOfString:@"." withString:@"-" options:NSLiteralSearch range:NSMakeRange(0, [newSlug length])];
                    
                    [_presentersSlug addObject:newSlug];
                }
            }
        }
    }
    
    return self;
}

@end
