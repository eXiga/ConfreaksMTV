//
//  FTBaseProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTBaseProvider.h"
#import "FTResourceDownloader.h"

NSString *const BaseApiURL = @"FTBaseApiURL";

@implementation FTBaseProvider

- (instancetype)initWithEndpointName:(NSString *)endpoint {
    self = [super init];
    if (self) {
        _url = [NSURL URLWithString:endpoint relativeToURL:[self baseUrl]];
    }

    return self;
}

- (NSURL *)baseUrl {
    return  [NSURL URLWithString:[[[NSBundle mainBundle] infoDictionary] objectForKey:BaseApiURL]];
}

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    [self doesNotRecognizeSelector:_cmd];
}


@end
