//
//  FTPresenter.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTPresenter.h"

@implementation FTPresenter

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    
    if (self) {
        _presenterId = params[@"id"];
        _slug = params[@"slug"];
        _firstName = params[@"first_name"];
        _lastName = params[@"last_name"];
        _akaName = params[@"aka_name"];
        _twitterHandle = params[@"twitter_handle"];
        _videoCount = params[@"video_count"];
    }
    
    return self;
}

@end
