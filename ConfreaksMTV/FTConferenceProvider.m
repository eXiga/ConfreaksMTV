//
//  ConferenceProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTConferenceProvider.h"
#import "FTResponseParser.h"

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
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseConferences:object], error);
    }];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    NSString *castedEntityId = [entityId isKindOfClass:[NSString class]] ? (NSString *)entityId : [entityId stringValue];
    NSURL *resourceUrl = [self.url URLByAppendingPathComponent:castedEntityId];
    NSURLRequest *request = [NSURLRequest requestWithURL:resourceUrl];
    [FTResourceDownloader getRequest:request withHandler:^(id object, NSError *error) {
        handler([FTResponseParser parseConferences:object], error);
    }];
}

@end
