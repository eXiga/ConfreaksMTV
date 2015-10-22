//
//  FTVideo.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTVideo : NSObject

@property (strong, nonatomic) NSNumber *videoId;
@property (strong, nonatomic) NSString *slug;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSDate *recordedAt;
@property (strong, nonatomic) NSString *event;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *abstract;
@property (strong, nonatomic) NSDate *postDate;
@property (strong, nonatomic) NSDate *announceDate;
@property (strong, nonatomic) NSString *host;
@property (strong, nonatomic) NSString *embedCode;
@property (strong, nonatomic) NSNumber *views;
@property (strong, nonatomic) NSNumber *viewsLast7;
@property (strong, nonatomic) NSNumber *viewsLast30;
@property (strong, nonatomic) NSString *license;
@property (strong, nonatomic) NSString *attribution;
@property (strong, nonatomic) NSMutableArray *presentersSlug;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
