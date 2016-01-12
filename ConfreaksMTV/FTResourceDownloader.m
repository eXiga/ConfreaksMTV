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
        id json = [NSJSONSerialization JSONObjectWithData:data
                                                  options:kNilOptions
                                                    error:nil];
        
        // We need to return all the data in unified format - NSArray in our case.
        // Usually Confreaks returns array of dictionaries.
        // However, if you request only one item (e.g. particular conference), single
        // dictionary will be returned. That's why we need some logic to convert it into array.
        if (json != nil && [json isKindOfClass:[NSDictionary class]]) {
            NSArray *jsonArray = [NSArray arrayWithObject:json];
            handler(jsonArray, error);
        } else {
            handler(json, error);
        }
    }];
    
    [task resume];
}

@end
