//
//  FTEvent.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FTConference;

@interface FTEvent : NSObject

@property (strong, nonatomic) NSNumber *eventId;
@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *shortCode;
@property (strong, nonatomic) NSDate *startAt;
@property (strong, nonatomic) NSDate *endAt;
@property (strong, nonatomic) NSNumber *videoCount;
@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSNumber *confId;
@property (strong, nonatomic) NSString *confName;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
