//
//  FTEvent.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/21/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTEvent.h"

@implementation FTEvent

- (instancetype)initWithEventId:(NSNumber *)eventId eventDisplayName:(NSString *)eventDisplayName eventShortCode:(NSString *)eventShortCode eventStartAt:(NSDate *)eventStartAt eventEndAt:(NSDate *)eventEndAt eventConference:(FTConference *)eventConference {
    self = [super init];
    
    if (self) {
        _eventId = eventId;
        _displayName = eventDisplayName;
        _shortCode = eventShortCode;
        _startAt = eventStartAt;
        _endAt = eventEndAt;
        _conference = eventConference;
    }
    
    return self;
}

- (instancetype) initWithEventId:(NSNumber *)eventId eventShortCode:(NSString *)eventShortCode eventStartAt:(NSDate *)eventStartAt eventEndAt:(NSDate *)eventEndAt eventVideoCount:(NSNumber *)eventVideoCount eventLogo:(NSString *)eventLogo eventConference:(FTConference *)eventConference {
    self = [super init];
    
    if (self) {
        _eventId = eventId;
        _shortCode = eventShortCode;
        _startAt = eventStartAt;
        _endAt = eventEndAt;
        _videoCount = eventVideoCount;
        _logo = eventLogo;
        _conference = eventConference;
    }
    
    return self;
}

@end
