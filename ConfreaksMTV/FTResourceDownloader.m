//
//  FTResourceDownloader.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/16/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTResourceDownloader.h"

@implementation FTResourceDownloader

+ (void)getRequest:(NSURLRequest *)request withHandler:(FTResponseHandler)handler {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:nil];
        handler(json, error);
    }];
    
    [task resume];
}

@end
