//
//  FTBaseProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTBaseProvider.h"

@implementation FTBaseProvider

- (instancetype)initWithEndpointName:(NSString  *)endpoint {
    self = [super init];
    if (self) {
        _endpointName = endpoint;
        
        // TODO(@chupa)
        // redisign to something flexibale
        // rebase base URL from ServiceConfiguration somewhere else
        NSURL *baseUrl = [NSURL URLWithString:@"http://confreaks.tv/api/v1/"];
        NSURL *url = [NSURL URLWithString:_endpointName relativeToURL:baseUrl];
        _resourseDownloader = [[FTResourceDownloader alloc] initWithUrl:url];
    }

    return self;
}

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    [NSException raise:@"NotImplementedException" format:@"Method should be overrided in subclass"];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    [NSException raise:@"NotImplementedException" format:@"Method should be overrided in subclass"];
}

@end
