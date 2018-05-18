//
//  FTPresenter.h
//  ConfreaksAPI
//
//  Created by Anton Kastsenich on 18/05/2018.
//  Copyright © 2018 Anton Kastsenich. All rights reserved.
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
