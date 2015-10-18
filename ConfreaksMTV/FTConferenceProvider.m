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

- (_Nullable instancetype)init {
    self = [super initWithEndpointName:ConferencesEndpointName];
    
    if (self) {
        
    }
    
    return self;
}

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [FTResourceDownloader getRequest:request withHandler:handler];
}

@end
