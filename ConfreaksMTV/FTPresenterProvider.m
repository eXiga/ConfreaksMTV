//
//  PresenterProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTPresenterProvider.h"
#import "FTResourceDownloader.h"

NSString *const PresentersEndpointName = @"presenters";
NSString *const PresentersVideosResourceName = @"videos";

@implementation FTPresenterProvider

- (instancetype)init {
    self = [super initWithEndpointName:PresentersEndpointName];
    
    if (self) {
        
    }
    
    return self;
}

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *presenterId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *presenterUrl = [self.url URLByAppendingPathComponent:presenterId];
    NSURLRequest *request = [NSURLRequest requestWithURL:presenterUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getVideosForPresenter:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *presenterId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *presenterUrl = [self.url URLByAppendingPathComponent:presenterId];
    NSURL *videosUrl = [presenterUrl URLByAppendingPathComponent:PresentersVideosResourceName];
    NSURLRequest *request = [NSURLRequest requestWithURL:videosUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

@end
