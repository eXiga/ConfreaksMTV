//
//  FTPresenter.h
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTPresenter : NSObject

@property (strong, nonatomic) NSNumber *presenterId;
@property (strong, nonatomic) NSString *slug;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *akaName;
@property (strong, nonatomic) NSString *twitterHandle;
@property (strong, nonatomic) NSNumber *videoCount;

- (instancetype)initWithParams:(NSDictionary *)params;

@end
