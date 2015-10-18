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

#define FIXTURE(x) OHPathForFileInBundle(@ #x ".json", OHResourceBundle(@"Fixtures", self.class))

#endif /* SpecHelper_h */
