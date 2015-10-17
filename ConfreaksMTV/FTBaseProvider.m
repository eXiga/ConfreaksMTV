//
//  FTBaseProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTBaseProvider.h"

NSString *const BaseApiURL = @"FTBaseApiURL";

@implementation FTBaseProvider

- (instancetype)initWithEndpointName:(NSString *)endpoint {
    self = [super init];
    if (self) {
        NSURL *baseUrl = [NSURL URLWithString:[[[NSBundle mainBundle] infoDictionary] objectForKey:BaseApiURL]];
        _url = [NSURL URLWithString:endpoint relativeToURL:baseUrl];
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
