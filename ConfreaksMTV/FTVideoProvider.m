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

- (void)getAllEntitiesUsingLimit:(NSNumber *)limit orderedByDescending:(BOOL)ordered withCompletionHandler:(FTResponseHandler)handler {
    NSString *queryString = [NSString stringWithFormat:@"limit=%li", (long)[limit integerValue]];
    
    if (ordered) {
        queryString = [NSString stringWithFormat:@"%@&sort=most_viewed", queryString];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", [self.url absoluteString], queryString]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *videoId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *videoUrl = [self.url URLByAppendingPathComponent:videoId];
    NSURLRequest *request = [NSURLRequest requestWithURL:videoUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getVideoCountWithCompletionHandler:(FTResponseHandler)handler {
    NSURL *videoCountUrl = [[self baseUrl] URLByAppendingPathComponent:VideosCountResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videoCountUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getFeaturedVideoWithCompletionHandler:(FTResponseHandler)handler {
    NSURL *featuredVideoUrl = [[self baseUrl] URLByAppendingPathComponent:VideoFeaturedResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:featuredVideoUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getVideosForPresenter:(id)presenterId atEvent:(id)eventId withCompletionHandler:(FTResponseHandler)handler {
    NSString *presenter = [presenterId isKindOfClass:[NSString class]] ? (NSString *)presenterId : [presenterId stringValue];
    NSString *event = [eventId isKindOfClass:[NSString class]] ? (NSString *)eventId : [eventId stringValue];
    NSURL *presenterUrl = [[[self baseUrl] URLByAppendingPathComponent:PresentersEndpointName] URLByAppendingPathComponent:presenter];
    NSURL *eventUrl = [[presenterUrl URLByAppendingPathComponent:EventsEndpointName] URLByAppendingPathComponent:event];
    NSURL *videosUrl = [eventUrl URLByAppendingPathComponent:VideosEndpointName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videosUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

@end
