//
//  FTResourceDownloader.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/16/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTResourceDownloader.h"

@interface FTResourceDownloader()

@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation FTResourceDownloader

- (instancetype)initWithUrl: (NSURL *)url {
    self = [super init];

    if (self) {
        _request = [[NSURLRequest alloc] initWithURL:url];
        _session = [NSURLSession sharedSession];
    }
    
    return self;
}

- (void)getResquestWithHandler:(FTResponseHandler)handler {
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:self.request
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        handler(data, error);
    }];
    
    [task resume];
}

@end
