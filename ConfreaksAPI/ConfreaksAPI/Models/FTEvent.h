//
//  FTEvent.h
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FTConference;

@interface FTEvent : NSObject

@property (strong, readonly, nonatomic) NSNumber *eventId;
@property (strong, readonly, nonatomic) NSString *displayName;
@property (strong, readonly, nonatomic) NSString *shortCode;
@property (strong, readonly, nonatomic) NSDate *startAt;
@property (strong, readonly, nonatomic) NSDate *endAt;
@property (strong, readonly, nonatomic) NSNumber *videoCount;
@property (strong, readonly, nonatomic) NSString *logo;
@property (strong, readonly, nonatomic) NSNumber *conferenceId;
@property (strong, readonly, nonatomic) NSString *conferenceName;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
