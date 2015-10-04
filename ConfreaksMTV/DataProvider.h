//
//  DataProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FTResponseHandler)(_Nullable id object,  NSError * _Nullable  error);

@protocol DataProvider <NSObject>

- (void)getAllEntitiesWithCompletionHandler:(_Nonnull FTResponseHandler)handler;
- (void)getEntityForId:(_Nonnull id)entityId withCompletionHandler:(_Nonnull FTResponseHandler)handler;

@end
