//
//  FTResourceDownloader.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/16/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

@interface FTResourceDownloader : NSObject

- (instancetype)initWithUrl: (NSURL *)url;
- (void)getResquestWithHandler: (FTResponseHandler)handler;

@end
