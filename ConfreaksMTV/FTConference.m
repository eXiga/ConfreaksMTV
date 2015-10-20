//
//  FTConference.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTConference.h"

@implementation FTConference

- (instancetype)initWithConfName:(NSString *)confName confId:(NSNumber *)confId confEventCount:(NSNumber *)confEventCount {
    self = [super init];
    
    if (self) {
        _name = confName;
        _conferenceId = confId;
        _eventCount = confEventCount;
    }
    
    return self;
}

- (void)addEventObject:(FTEvent *)event {
    if (!self.events) {
        self.events = [NSMutableArray new];
    }
    [self.events addObject:event];
}

@end
