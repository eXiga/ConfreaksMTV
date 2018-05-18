//
//  FTBaseProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTDataProvider.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const BaseApiURL;

@interface FTBaseProvider : NSObject<FTDataProvider>

@property (nonatomic, strong) NSURL *url;

- (_Nullable instancetype)initWithEndpointName:(NSString *)endpoint;

- (NSURL *)baseUrl;

@end

NS_ASSUME_NONNULL_END
