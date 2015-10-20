//
//  EventProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTBaseProvider.h"

FOUNDATION_EXPORT NSString *const EventsEndpointName;
FOUNDATION_EXPORT NSString *const EventsCountResourceName;
FOUNDATION_EXPORT NSString *const EventsVideosResourceName;

@interface FTEventProvider : FTBaseProvider

- (void)getEventCountWithCompletionHandler:(FTResponseHandler)handler;
- (void)getVideosForEvent:(id)entityId withCompletionHandler:(FTResponseHandler)handler;

@end
