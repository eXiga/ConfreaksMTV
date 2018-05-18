//
//  FTConference.m
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
//

#import "FTConference.h"

@implementation FTConference

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];

    if (self) {
        _conferenceId = params[@"id"];
        _name = params[@"name"];
        _eventCount = params[@"event_count"];

        if (params[@"events"] != nil) {
            NSArray *events = params[@"events"];
            _eventsId = [NSMutableArray new];

            for (NSDictionary *event in events) {
                [_eventsId addObject:event[@"id"]];
            }
        }
    }

    return self;
}

@end
