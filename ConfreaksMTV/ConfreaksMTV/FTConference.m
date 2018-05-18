//
//  FTConference.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
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