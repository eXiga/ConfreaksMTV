//
//  FTPresenterSpec.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/23/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTPresenter.h"

SpecBegin(FTPresenter)

describe(@"FTPresenter", ^{
    __block FTPresenter *presenter;
    __block NSDictionary *allPresentersJsonFormat;
    __block NSDictionary *onePresenterJsonFormat;
    
    beforeAll(^{
        allPresentersJsonFormat = @{@"id" : @22, @"slug" : @"aaron-bedra", @"first_name" : @"Aaron", @"last_name" : @"Bedra", @"aka_name" : [NSNull null], @"twitter_handle" : @"abedra"};
        
        onePresenterJsonFormat = @{@"id" : @75, @"slug" : @"jake-cahoon", @"first_name" : @"Jake", @"last_name" : @"Cahoon", @"aka_name" : @"", @"twitter_handle" : @"", @"video_count" : @1};
    });
    
    context(@"when all presenters format was received", ^{
        beforeEach(^{
            presenter = [[FTPresenter alloc] initWithParams:allPresentersJsonFormat];
        });
        
        it(@"is expected to return correct id", ^{
            expect(presenter.presenterId).to.equal(@22);
        });
        
        it(@"is expected to return correct slug", ^{
            expect(presenter.slug).to.equal(@"aaron-bedra");
        });
        
        it(@"is expected to return correct first name", ^{
            expect(presenter.firstName).to.equal(@"Aaron");
        });
        
        it(@"is expected to return correct last name", ^{
            expect(presenter.lastName).to.equal(@"Bedra");
        });
        
        it(@"is expected to return correct aka name", ^{
            expect(presenter.akaName.class).to.equal([NSNull class]);
        });
        
        it(@"is expected to return correct twitter handle", ^{
            expect(presenter.twitterHandle).to.equal(@"abedra");
        });
    });
    
    context(@"when one presenter format was received", ^{
        beforeEach(^{
            presenter = [[FTPresenter alloc] initWithParams:onePresenterJsonFormat];
        });
        
        it(@"is expected to return correct id", ^{
            expect(presenter.presenterId).to.equal(@75);
        });
        
        it(@"is expected to return correct slug", ^{
            expect(presenter.slug).to.equal(@"jake-cahoon");
        });
        
        it(@"is expected to return correct first name", ^{
            expect(presenter.firstName).to.equal(@"Jake");
        });
        
        it(@"is expected to return correct last name", ^{
            expect(presenter.lastName).to.equal(@"Cahoon");
        });
        
        it(@"is expected to return correct aka name", ^{
            expect(presenter.akaName).to.equal(@"");
        });
        
        it(@"is expected to return correct twitter handle", ^{
            expect(presenter.twitterHandle).to.equal(@"");
        });
        
        it(@"is expected to return correct video count", ^{
            expect(presenter.videoCount).to.equal(@1);
        });
    });
});

SpecEnd
