//
//  FTConference.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTConference : NSObject

@property (strong, readonly, nonatomic) NSNumber *conferenceId;
@property (strong, readonly, nonatomic) NSString *name;
@property (strong, readonly, nonatomic) NSNumber *eventCount;
@property (strong, readonly, nonatomic) NSMutableArray *eventsId;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
