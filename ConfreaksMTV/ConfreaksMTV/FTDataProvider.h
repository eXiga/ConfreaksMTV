//
//  FTDataProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FTResponseHandler)(_Nullable id object,  NSError * _Nullable  error);

NS_ASSUME_NONNULL_BEGIN

@protocol FTDataProvider <NSObject>

- (void)getAllEntitiesWithCompletionHandler:(FTResponseHandler)handler;
- (void)getEntityForId:(id)entityId withCompletionHandler:(FTResponseHandler)handler;

@end

NS_ASSUME_NONNULL_END
