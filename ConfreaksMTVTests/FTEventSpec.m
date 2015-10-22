//
//  FTEventSpec.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/22/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTEvent.h"

SpecBegin(FTEvent)

describe(@"FTEvent", ^{
    __block FTEvent *event;
    __block NSDictionary *allEventsJsonFormat;
    __block NSDictionary *oneEventJsonFormat;
    
    beforeAll(^{
        allEventsJsonFormat = @{@"id" : @293, @"display_name" : @"Ruby Conference 2015", @"conference" : @"Ruby Conference", @"short_code" : @"rubyconf2015", @"start_at" : @"2015-11-15T00:00:00.000Z", @"end_at" : @"2015-11-17T00:00:00.000Z"};
        oneEventJsonFormat = @{@"id" : @293, @"short_code" : @"rubyconf2015", @"start_at" : @"2015-11-15T00:00:00.000Z", @"end_at" : @"2015-11-17T00:00:00.000Z", @"video_count" : @0, @"logo" : @"http://s3-us-west-2.amazonaws.com/confreaks-tv3/production/events/logos/000/000/293/rc-main-logo-2-original.png?1445375694", @"conference" : @{ @"id" : @3, @"name" : @"Ruby Conference"}};
    });
    
    context(@"when all events format was received", ^{
        beforeEach(^{
            event = [[FTEvent alloc] initWithParams:allEventsJsonFormat];
        });
        
        it(@"is expected to return correct id", ^{
            expect(event.eventId).to.equal(@293);
        });
        
        it(@"is expected to change id correctly", ^{
            event.eventId = @123;
            expect(event.eventId).to.equal(@123);
        });
        
        it(@"is expected to return correct display name", ^{
            expect(event.displayName).to.equal(@"Ruby Conference 2015");
        });
        
        it(@"is expected to change display name correctly", ^{
            event.displayName = @"Test Display Name";
            expect(event.displayName).to.equal(@"Test Display Name");
        });
        
        it(@"is expected to return correct short code", ^{
            expect(event.shortCode).to.equal(@"rubyconf2015");
        });
        
        it(@"is expected to change short code correctly", ^{
            event.shortCode = @"testshort";
            expect(event.shortCode).to.equal(@"testshort");
        });
        
        it(@"is expected to return correct conference name", ^{
            expect(event.conferenceName).to.equal(@"Ruby Conference");
        });
        
        it(@"is expected to change conference name correctly", ^{
            event.conferenceName = @"Test Conference";
            expect(event.conferenceName).to.equal(@"Test Conference");
        });
        
        it(@"is expected for conference id to be nil", ^{
            expect(event.conferenceId).to.beNil();
        });
        
        it(@"is expected for logo to be nil", ^{
            expect(event.logo).to.beNil();
        });
        
        it(@"is expected for video count to be nil", ^{
            expect(event.videoCount).to.beNil();
        });
        
        it(@"is expected to return correct start date/time", ^{
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
            NSDate *dateToCompareWith = [dateFormatter dateFromString:@"2015-11-15T00:00:00.000Z"];
            
            expect(event.startAt).to.equal(dateToCompareWith);
        });
        
        it(@"is expected to return correct end date/time", ^{
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
            NSDate *dateToCompareWith = [dateFormatter dateFromString:@"2015-11-17T00:00:00.000Z"];
            
            expect(event.endAt).to.equal(dateToCompareWith);
        });
    });
    
    context(@"when one event format was received", ^{
        beforeEach(^{
            event = [[FTEvent alloc] initWithParams:oneEventJsonFormat];
        });
        
        it(@"is expected to return correct id", ^{
            expect(event.eventId).to.equal(@293);
        });
        
        it(@"is expected to change id correctly", ^{
            event.eventId = @321;
            expect(event.eventId).to.equal(@321);
        });
        
        it(@"is expected for display name to be nil", ^{
            expect(event.displayName).to.beNil();
        });
        
        it(@"is expected to return correct short code", ^{
            expect(event.shortCode).to.equal(@"rubyconf2015");
        });
        
        it(@"is expected to change short code correctly", ^{
            event.shortCode = @"testshort";
            expect(event.shortCode).to.equal(@"testshort");
        });
        
        it(@"is expected to return correct conference name", ^{
            expect(event.conferenceName).to.equal(@"Ruby Conference");
        });
        
        it(@"is expected to change conference name correctly", ^{
            event.conferenceName = @"Test Conference";
            expect(event.conferenceName).to.equal(@"Test Conference");
        });
        
        it(@"is expected to return correct conference id", ^{
            expect(event.conferenceId).to.equal(@3);
        });
        
        it(@"is expected to change conference id correctly", ^{
            event.conferenceId = @7;
            expect(event.conferenceId).to.equal(@7);
        });
        
        it(@"is expected return correct logo address", ^{
            expect(event.logo).to.equal(@"http://s3-us-west-2.amazonaws.com/confreaks-tv3/production/events/logos/000/000/293/rc-main-logo-2-original.png?1445375694");
        });
        
        it(@"is expected to change logo address correctly", ^{
            event.logo = @"test://logo";
            expect(event.logo).to.equal(@"test://logo");
        });
        
        it(@"is expected return correct video count", ^{
            expect(event.videoCount).to.equal(@0);
        });
        
        it(@"is expected to change video count correctly", ^{
            event.videoCount = @10;
            expect(event.videoCount).to.equal(@10);
        });
        
        it(@"is expected to return correct start date/time", ^{
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
            NSDate *dateToCompareWith = [dateFormatter dateFromString:@"2015-11-15T00:00:00.000Z"];
            
            expect(event.startAt).to.equal(dateToCompareWith);
        });
        
        it(@"is expected to return correct end date/time", ^{
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
            NSDate *dateToCompareWith = [dateFormatter dateFromString:@"2015-11-17T00:00:00.000Z"];
            
            expect(event.endAt).to.equal(dateToCompareWith);
        });
    });
});

SpecEnd
