//
//  FTService.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTConferenceProvider.h"
#import "FTEventProvider.h"
#import "FTVideoProvider.h"
#import "FTPresenterProvider.h"

@interface FTService : NSObject

@property (strong, nonatomic) FTConferenceProvider *conferenceProvider;
@property (strong, nonatomic) FTEventProvider *eventProvider;
@property (strong, nonatomic) FTVideoProvider *videoProvider;
@property (strong, nonatomic) FTPresenterProvider *presenterProvider;

+ (id)sharedInstance;

@end
