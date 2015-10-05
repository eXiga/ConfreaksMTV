//
//  FTBaseProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

@interface FTBaseProvider : NSObject<DataProvider>

@property (nonatomic, strong) NSString * _Nullable endpointName;

- (_Nullable instancetype)initWithEndpointName: (NSString  * _Nonnull )endpoint;

@end
