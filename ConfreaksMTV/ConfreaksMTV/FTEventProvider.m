//
//  EventProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTEventProvider.h"
#import "FTResourceDownloader.h"
#import "FTResponseParser.h"

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
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseEvents:object], error);
    }];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *castedEntityId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *resourceUrl = [self.url URLByAppendingPathComponent:castedEntityId];
    NSURLRequest *request = [NSURLRequest requestWithURL:resourceUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseEvents:object], error);
    }];
}

- (void)getEventCountWithCompletionHandler:(FTResponseHandler)handler {
    NSURL *eventCountUrl = [[self baseUrl] URLByAppendingPathComponent:EventsCountResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:eventCountUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseEvents:object], error);
    }];
}

- (void)getVideosForEvent:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *eventId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *eventUrl = [self.url URLByAppendingPathComponent:eventId];
    NSURL *videosUrl = [eventUrl URLByAppendingPathComponent:EventsVideosResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videosUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseEvents:object], error);
    }];
}

- (void)getAllEntitiesUsingLimit:(NSNumber *)limit orderedByDescending:(BOOL)ordered withCompletionHandler:(FTResponseHandler)handler {
    NSString *queryString = [NSString stringWithFormat:@"limit=%li", (long)[limit integerValue]];
    
    if (ordered) {
        queryString = [NSString stringWithFormat:@"%@&sort=recent", queryString];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", [self.url absoluteString], queryString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseEvents:object], error);
    }];
}

@end
