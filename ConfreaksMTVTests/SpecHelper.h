//
//  SpecHelper.h
//  ConfreaksMTV
//
//  Created by Anton Kostenich on 27.09.15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#ifndef SpecHelper_h
#define SpecHelper_h

#import <XCTest/XCTest.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>


#pragma mark - OHTTPStubs macros

#define FIXTURE(x) OHPathForFileInBundle(@ #x ".json", OHResourceBundle(@"Fixtures", self.class))
#define SUCCESS_STATUS_CODE 200
#define DEFAULT_HEADERS @{@"Content-Type":@"application/json"}

#endif /* SpecHelper_h */
