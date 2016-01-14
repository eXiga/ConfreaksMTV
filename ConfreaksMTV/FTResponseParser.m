//
//  FTResponseParser.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 1/4/16.
//  Copyright © 2016 Anton Kostenich. All rights reserved.
//

#import "FTResponseParser.h"

@implementation FTResponseParser

+ (NSArray<FTConference*> *)parseConferences:(NSArray *)conferences {
    NSMutableArray<FTConference*> *array = [NSMutableArray array];
    
    for (NSDictionary *obj in conferences) {
        [array addObject:[[FTConference alloc] initWithParams:obj]];
    }
    
    return array;
}

+ (NSArray<FTEvent*> *)parseEvents:(NSArray *)events {
    NSMutableArray<FTEvent*> *array = [NSMutableArray array];
    
    for (NSDictionary *obj in events) {
        [array addObject:[[FTEvent alloc] initWithParams:obj]];
    }
    
    return array;
}

+ (NSArray<FTPresenter*> *)parsePresenters:(NSArray *)presenters {
    NSMutableArray<FTPresenter*> *array = [NSMutableArray array];
    
    for (NSDictionary *obj in presenters) {
        [array addObject:[[FTPresenter alloc] initWithParams:obj]];
    }
    
    return array;
}

+ (NSArray<FTVideo*> *)parseVideos:(NSArray *)videos {
    NSMutableArray<FTVideo*> *array = [NSMutableArray array];
    
    for (NSDictionary *obj in videos) {
        [array addObject:[[FTVideo alloc] initWithParams:obj]];
    }
    
    return array;
}

@end
