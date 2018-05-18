//
//  FTConference.h
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTConference : NSObject

@property (strong, readonly, nonatomic) NSNumber *conferenceId;
@property (strong, readonly, nonatomic) NSString *name;
@property (strong, readonly, nonatomic) NSNumber *eventCount;
@property (strong, readonly, nonatomic) NSMutableArray *eventsId;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
