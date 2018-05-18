//
//  FTPresenter.m
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
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
