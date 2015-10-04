//
//  FTBaseProvider.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTBaseProvider.h"

@implementation FTBaseProvider

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler {
    [NSException raise:@"NotImplementedException" format:@"Method should be overrided in subclass"];
}

- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler {
    [NSException raise:@"NotImplementedException" format:@"Method should be overrided in subclass"];
}

@end
