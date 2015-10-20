//
//  FTBaseProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const BaseApiURL;

@interface FTBaseProvider : NSObject<DataProvider>

@property (nonatomic, strong) NSURL *url;

- (_Nullable instancetype)initWithEndpointName:(NSString *)endpoint;

- (NSURL *)baseUrl;

@end

NS_ASSUME_NONNULL_END
