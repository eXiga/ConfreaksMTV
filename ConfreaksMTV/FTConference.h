//
//  FTConference.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTEvent.h"

@interface FTConference : NSObject

@property (strong, nonatomic) NSNumber *conferenceId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *eventCount;
@property (strong, nonatomic) NSMutableArray *events;

- (instancetype)initWithConfName:(NSString *)confName confId:(NSNumber *)confId confEventCount:(NSNumber *)confEventCount;
- (void)addEventObject:(FTEvent *)event;

@end
