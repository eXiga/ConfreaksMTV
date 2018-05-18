//
//  VideoProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTBaseProvider.h"

FOUNDATION_EXPORT NSString *const VideosEndpointName;
FOUNDATION_EXPORT NSString *const VideosCountResourceName;
FOUNDATION_EXPORT NSString *const VideoFeaturedResourceName;

@interface FTVideoProvider : FTBaseProvider

- (void)getAllEntitiesUsingLimit:(NSNumber *)limit orderedByDescending:(BOOL)ordered withCompletionHandler:(FTResponseHandler)handler;
- (void)getVideoCountWithCompletionHandler:(FTResponseHandler)handler;
- (void)getFeaturedVideoWithCompletionHandler:(FTResponseHandler)handler;
- (void)getVideosForPresenter:(id)presenterId atEvent:(id)eventId withCompletionHandler:(FTResponseHandler)handler;

@end
