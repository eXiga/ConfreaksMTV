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
@property (weak, nonatomic) FTConference *conference;

- (instancetype)initWithEventId:(NSNumber *)eventId eventDisplayName:(NSString *)eventDisplayName eventShortCode:(NSString *)eventShortCode eventStartAt:(NSDate *)eventStartAt eventEndAt:(NSDate *)eventEndAt eventConference:(FTConference *)eventConference;
- (instancetype)initWithEventId:(NSNumber *)eventId eventShortCode:(NSString *)eventShortCode eventStartAt:(NSDate *)eventStartAt eventEndAt:(NSDate *)eventEndAt eventVideoCount:(NSNumber *)eventVideoCount eventLogo:(NSString *)eventLogo eventConference:(FTConference *)eventConference;

@end
