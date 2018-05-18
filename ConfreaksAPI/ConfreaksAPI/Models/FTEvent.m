//
//  FTEvent.m
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
//

#import "FTEvent.h"

@implementation FTEvent

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];

    if (self) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];

        _eventId = params[@"id"];
        _displayName = params[@"display_name"];
        _shortCode = params[@"short_code"];
        _videoCount = params[@"video_count"];
        _logo = params[@"logo"];

        if ([params[@"start_at"] class] != [NSNull class]) {
            _startAt = [dateFormatter dateFromString:params[@"start_at"]];
        }

        if ([params[@"end_at"] class] != [NSNull class]) {
            _endAt = [dateFormatter dateFromString:params[@"end_at"]];
        }

        if ([params[@"conference"] isKindOfClass:[NSDictionary class]]) {
            _conferenceId = [params valueForKeyPath:@"conference.id"];
            _conferenceName = [params valueForKeyPath:@"conference.name"];
        } else {
            _conferenceName = params[@"conference"];
        }
    }

    return self;
}

@end
