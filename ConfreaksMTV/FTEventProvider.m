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

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *eventNumber = [entityId stringValue];
    NSURL *eventUrl = [self.url URLByAppendingPathComponent:eventNumber];
    NSURLRequest *request = [NSURLRequest requestWithURL:eventUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getEventCount:(FTResponseHandler)handler {
    NSURL *eventCountUrl = [[self baseUrl] URLByAppendingPathComponent:EventsCountResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:eventCountUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getVideosForEvent:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *eventNumber = [entityId stringValue];
    NSURL *eventUrl = [self.url URLByAppendingPathComponent:eventNumber];
    NSURL *videosUrl = [eventUrl URLByAppendingPathComponent:EventsVideosResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videosUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

@end
