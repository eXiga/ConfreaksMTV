//
//  FTVideo.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTVideo : NSObject

@property (strong, readonly, nonatomic) NSNumber *videoId;
@property (strong, readonly, nonatomic) NSString *slug;
@property (strong, readonly, nonatomic) NSString *title;
@property (strong, readonly, nonatomic) NSString *image;
@property (strong, readonly, nonatomic) NSDate *recordedAt;
@property (strong, readonly, nonatomic) NSString *event;
@property (strong, readonly, nonatomic) NSString *rating;
@property (strong, readonly, nonatomic) NSString *abstract;
@property (strong, readonly, nonatomic) NSDate *postDate;
@property (strong, readonly, nonatomic) NSDate *announceDate;
@property (strong, readonly, nonatomic) NSString *host;
@property (strong, readonly, nonatomic) NSString *embedCode;
@property (strong, readonly, nonatomic) NSNumber *views;
@property (strong, readonly, nonatomic) NSNumber *viewsLast7;
@property (strong, readonly, nonatomic) NSNumber *viewsLast30;
@property (strong, readonly, nonatomic) NSString *license;
@property (strong, readonly, nonatomic) NSString *attribution;
@property (strong, readonly, nonatomic) NSMutableArray *presentersSlug;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
