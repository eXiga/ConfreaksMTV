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
        
        it(@"is expected to change id correctly", ^{
            presenter.presenterId = @123;
            expect(presenter.presenterId).to.equal(@123);
        });
        
        it(@"is expected to return correct slug", ^{
            expect(presenter.slug).to.equal(@"aaron-bedra");
        });
        
        it(@"is expected to change slug correctly", ^{
            presenter.slug = @"test-slug";
            expect(presenter.slug).to.equal(@"test-slug");
        });
        
        it(@"is expected to return correct first name", ^{
            expect(presenter.firstName).to.equal(@"Aaron");
        });
        
        it(@"is expected to change first name correctly", ^{
            presenter.firstName = @"First";
            expect(presenter.firstName).to.equal(@"First");
        });
        
        it(@"is expected to return correct last name", ^{
            expect(presenter.lastName).to.equal(@"Bedra");
        });
        
        it(@"is expected to change last name correctly", ^{
            presenter.lastName = @"Last";
            expect(presenter.lastName).to.equal(@"Last");
        });
        
        it(@"is expected to return correct aka name", ^{
            expect(presenter.akaName.class).to.equal([NSNull class]);
        });
        
        it(@"is expected to change aka name correctly", ^{
            presenter.akaName = @"AKA";
            expect(presenter.akaName).to.equal(@"AKA");
        });
        
        it(@"is expected to return correct twitter handle", ^{
            expect(presenter.twitterHandle).to.equal(@"abedra");
        });
        
        it(@"is expected to change twitter handle correctly", ^{
            presenter.twitterHandle = @"twitter";
            expect(presenter.twitterHandle).to.equal(@"twitter");
        });
    });
    
    context(@"when one presenter format was received", ^{
        beforeEach(^{
            presenter = [[FTPresenter alloc] initWithParams:onePresenterJsonFormat];
        });
        
        it(@"is expected to return correct id", ^{
            expect(presenter.presenterId).to.equal(@75);
        });
        
        it(@"is expected to change id correctly", ^{
            presenter.presenterId = @321;
            expect(presenter.presenterId).to.equal(@321);
        });
        
        it(@"is expected to return correct slug", ^{
            expect(presenter.slug).to.equal(@"jake-cahoon");
        });
        
        it(@"is expected to change slug correctly", ^{
            presenter.slug = @"test-slug2";
            expect(presenter.slug).to.equal(@"test-slug2");
        });
        
        it(@"is expected to return correct first name", ^{
            expect(presenter.firstName).to.equal(@"Jake");
        });
        
        it(@"is expected to change first name correctly", ^{
            presenter.firstName = @"First2";
            expect(presenter.firstName).to.equal(@"First2");
        });
        
        it(@"is expected to return correct last name", ^{
            expect(presenter.lastName).to.equal(@"Cahoon");
        });
        
        it(@"is expected to change last name correctly", ^{
            presenter.lastName = @"Last2";
            expect(presenter.lastName).to.equal(@"Last2");
        });
        
        it(@"is expected to return correct aka name", ^{
            expect(presenter.akaName).to.equal(@"");
        });
        
        it(@"is expected to change aka name correctly", ^{
            presenter.akaName = @"AKA2";
            expect(presenter.akaName).to.equal(@"AKA2");
        });
        
        it(@"is expected to return correct twitter handle", ^{
            expect(presenter.twitterHandle).to.equal(@"");
        });
        
        it(@"is expected to change twitter handle correctly", ^{
            presenter.twitterHandle = @"twitter2";
            expect(presenter.twitterHandle).to.equal(@"twitter2");
        });
        
        it(@"is expected to return correct video count", ^{
            expect(presenter.videoCount).to.equal(@1);
        });
        
        it(@"is expected to change video count correctly", ^{
            presenter.videoCount = @11;
            expect(presenter.videoCount).to.equal(@11);
        });
    });
});

SpecEnd
