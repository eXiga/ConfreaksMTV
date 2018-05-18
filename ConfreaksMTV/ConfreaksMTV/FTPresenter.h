//
//  FTPresenter.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTPresenter : NSObject

@property (strong, readonly, nonatomic) NSNumber *presenterId;
@property (strong, readonly, nonatomic) NSString *slug;
@property (strong, readonly, nonatomic) NSString *firstName;
@property (strong, readonly, nonatomic) NSString *lastName;
@property (strong, readonly, nonatomic) NSString *akaName;
@property (strong, readonly, nonatomic) NSString *twitterHandle;
@property (strong, readonly, nonatomic) NSNumber *videoCount;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
