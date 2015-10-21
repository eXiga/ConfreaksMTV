//
//  EventProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTEventProvider.h"
#import "FTResourceDownloader.h"

NSString *const EventsEndpointName = @"events";
NSString *const EventsCountResourceName = @"event_count";
NSString *const EventsVideosResourceName = @"videos";

@implementation FTEventProvider

- (instancetype)init {
    self = [super initWithEndpointName:EventsEndpointName];
    
    if (self) {
        
    }
    
    return self;
}

- (void)getEventCountWithCompletionHandler:(FTResponseHandler)handler {
    NSURL *eventCountUrl = [[self baseUrl] URLByAppendingPathComponent:EventsCountResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:eventCountUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getVideosForEvent:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *eventId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *eventUrl = [self.url URLByAppendingPathComponent:eventId];
    NSURL *videosUrl = [eventUrl URLByAppendingPathComponent:EventsVideosResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videosUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

@end
