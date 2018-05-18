//
//  FTResourceDownloader.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/16/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTDataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface FTResourceDownloader : NSObject

+ (void)getRequest:(NSURLRequest *)request withHandler:(FTResponseHandler)handler;

@end

NS_ASSUME_NONNULL_END
