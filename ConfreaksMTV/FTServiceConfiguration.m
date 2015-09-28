//
//  FTServiceConfiguration.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTServiceConfiguration.h"

@implementation FTServiceConfiguration

-(NSURL *)apiURL {
    return [NSURL URLWithString:@"http://confreaks.tv/api/v1/"];
}

@end
