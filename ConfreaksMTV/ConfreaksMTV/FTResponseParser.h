//
//  FTResponseParser.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 1/4/16.
//  Copyright © 2016 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FTEvent.h"
#import "FTConference.h"
#import "FTPresenter.h"
#import "FTVideo.h"

@interface FTResponseParser : NSObject

+ (NSArray<FTEvent*> *)parseEvents:(NSArray *)events;
+ (NSArray<FTConference*> *)parseConferences:(NSArray *)conferences;
+ (NSArray<FTPresenter*> *)parsePresenters:(NSArray *)presenters;
+ (NSArray<FTVideo*> *)parseVideos:(NSArray *)videos;

@end
