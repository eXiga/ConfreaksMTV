//
//  FTBaseProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 05.10.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"
#import "FTResourceDownloader.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTBaseProvider : NSObject<DataProvider>

@property (nonatomic, strong) NSString * endpointName;
@property (nonatomic, strong) FTResourceDownloader *resourseDownloader;

- (instancetype)initWithEndpointName: (NSString  *)endpoint;

@end

NS_ASSUME_NONNULL_END
