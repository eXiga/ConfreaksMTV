//
//  ConferenceProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTConferenceProvider.h"

NSString *const ConferencesEndpointName = @"conferences";

@implementation FTConferenceProvider

- (instancetype)init {
    self = [super initWithEndpointName:ConferencesEndpointName];
    
    if (self) {
        
    }
    
    return self;
}

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *conferenceId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *conferenceUrl = [self.url URLByAppendingPathComponent:conferenceId];
    NSURLRequest *request = [NSURLRequest requestWithURL:conferenceUrl];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

@end
