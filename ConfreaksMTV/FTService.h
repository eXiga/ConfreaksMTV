//
//  FTService.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

@interface FTService : NSObject

@property (strong, nonatomic) id<DataProvider> conferenceProvider;
@property (strong, nonatomic) id<DataProvider> eventProvider;
@property (strong, nonatomic) id<DataProvider> videoProvider;
@property (strong, nonatomic) id<DataProvider> presenterProvider;

+(id)sharedInstance;

@end
