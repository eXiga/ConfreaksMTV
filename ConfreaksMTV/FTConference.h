//
//  FTConference.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTConference : NSObject

@property (strong, nonatomic) NSNumber *conferenceId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *eventCount;
@property (strong, nonatomic) NSMutableArray *eventsId;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
