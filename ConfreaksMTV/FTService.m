//
//  FTService.m
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 29.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "FTService.h"
#import "FTConferenceProvider.h"
#import "FTEventProvider.h"
#import "FTVideoProvider.h"
#import "FTPresenterProvider.h"
#import "FTServiceConfiguration.h"

@interface FTService ()

@property (strong, nonatomic) FTServiceConfiguration *configuration;

@end

@implementation FTService

+(id)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self class] new];
    });
    
    return sharedInstance;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        _configuration = [FTServiceConfiguration new];
        _conferenceProvider = [FTConferenceProvider new];
        _eventProvider = [FTEventProvider new];
        _videoProvider = [FTVideoProvider new];
        _presenterProvider = [FTPresenterProvider new];
    }
    
    return self;
}

@end
