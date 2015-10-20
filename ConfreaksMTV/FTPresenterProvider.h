//
//  PresenterProvider.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTBaseProvider.h"

FOUNDATION_EXPORT NSString *const PresentersEndpointName;
FOUNDATION_EXPORT NSString *const PresentersVideosResourceName;

@interface FTPresenterProvider : FTBaseProvider

- (void)getVideosForPresenter:(id)entityId withCompletionHandler:(FTResponseHandler)handler;

@end
