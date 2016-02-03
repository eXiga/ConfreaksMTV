//
//  VideoProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTVideoProvider.h"
#import "FTResourceDownloader.h"
#import "FTPresenterProvider.h"
#import "FTEventProvider.h"
#import "FTResponseParser.h"

NSString *const VideosEndpointName = @"videos";
NSString *const VideosCountResourceName = @"video_count";
NSString *const VideoFeaturedResourceName = @"featured-video";

@implementation FTVideoProvider

- (instancetype)init {
    self = [super initWithEndpointName:VideosEndpointName];
    
    if (self) {
        
    }
    
    return self;
}

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseVideos:object], error);
    }];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *castedEntityId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *resourceUrl = [self.url URLByAppendingPathComponent:castedEntityId];
    NSURLRequest *request = [NSURLRequest requestWithURL:resourceUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseVideos:object], error);
    }];
}

- (void)getAllEntitiesUsingLimit:(NSNumber *)limit orderedByDescending:(BOOL)ordered withCompletionHandler:(FTResponseHandler)handler {
    NSString *queryString = [NSString stringWithFormat:@"limit=%li", (long)[limit integerValue]];
    
    if (ordered) {
        queryString = [NSString stringWithFormat:@"%@&sort=most_viewed", queryString];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", [self.url absoluteString], queryString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseVideos:object], error);
    }];
}

- (void)getVideoCountWithCompletionHandler:(FTResponseHandler)handler {
    NSURL *videoCountUrl = [[self baseUrl] URLByAppendingPathComponent:VideosCountResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videoCountUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseVideos:object], error);
    }];
}

- (void)getFeaturedVideoWithCompletionHandler:(FTResponseHandler)handler {
    NSURL *featuredVideoUrl = [[self baseUrl] URLByAppendingPathComponent:VideoFeaturedResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:featuredVideoUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseVideos:object], error);
    }];
}

- (void)getVideosForPresenter:(id)presenterId atEvent:(id)eventId withCompletionHandler:(FTResponseHandler)handler {
    NSString *presenter = [presenterId isKindOfClass:[NSString class]] ? (NSString *)presenterId : [presenterId stringValue];
    NSString *event = [eventId isKindOfClass:[NSString class]] ? (NSString *)eventId : [eventId stringValue];
    NSURL *presenterUrl = [[[self baseUrl] URLByAppendingPathComponent:PresentersEndpointName] URLByAppendingPathComponent:presenter];
    NSURL *eventUrl = [[presenterUrl URLByAppendingPathComponent:EventsEndpointName] URLByAppendingPathComponent:event];
    NSURL *videosUrl = [eventUrl URLByAppendingPathComponent:VideosEndpointName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videosUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseVideos:object], error);
    }];
}

@end
