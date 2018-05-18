//
//  FTConferenceSpec.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/22/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTConference.h"

SpecBegin(FTConference)

describe(@"FTConference", ^{
    __block FTConference *conference;
    __block NSDictionary *allConfJsonFormat;
    __block NSDictionary *oneConfJsonFormat;
    
    beforeAll(^{
        allConfJsonFormat = @{@"name" : @"Airbnb Tech Talks", @"id" : @58, @"event_count" : @2};
        
        NSArray *events = @[
                            @{@"id" : @236, @"short_code" : @"burlingtonruby2014", @"start_at" : @"2014-08-02T06:00:00.000Z", @"end_at" : @"2014-08-03T06:00:00.000Z"},
                            @{@"id" : @138, @"short_code" : @"btvruby2013", @"start_at" : @"2013-08-03T06:00:00.000Z", @"end_at" : @"2013-08-04T06:00:00.000Z"}
                            ];
        oneConfJsonFormat = @{@"id" : @78, @"name" : @"Burlington Ruby", @"event_count" : @2, @"events" : events};
        
    });
    
    context(@"when all conferences format was received", ^{
        beforeEach(^{
            conference = [[FTConference alloc] initWithParams:allConfJsonFormat];
        });
        
        it(@"is expected to return correct name", ^{
            expect(conference.name).to.equal(@"Airbnb Tech Talks");
        });
        
        it(@"is expected to return correct id", ^{
            expect(conference.conferenceId).to.equal(@58);
        });
        
        it(@"is expected to return correct number of events", ^{
            expect(conference.eventCount).to.equal(@2);
        });
        
        it(@"is expected for events id array to be nil", ^{
            expect(conference.eventsId).to.beNil();
        });
    });
    
    context(@"when one conference format was received", ^{
        beforeEach(^{
            conference = [[FTConference alloc] initWithParams:oneConfJsonFormat];
        });
        
        it(@"is expected to return correct name", ^{
            expect(conference.name).to.equal(@"Burlington Ruby");
        });
        
        it(@"is expected to return correct id", ^{
            expect(conference.conferenceId).to.equal(@78);
        });
        
        it(@"is expected to return correct number of events", ^{
            expect(conference.eventCount).to.equal(@2);
        });
        
        it(@"is expected to return correct amount of events", ^{
            expect(conference.eventsId.count).to.equal(2);
        });
        
        it(@"is expected to return correct events id", ^{
            expect(conference.eventsId[0]).to.equal(@236);
            expect(conference.eventsId[1]).to.equal(@138);
        });
    });
});

SpecEnd
