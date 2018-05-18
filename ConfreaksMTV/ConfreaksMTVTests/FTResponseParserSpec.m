//
//  FTResponseParserSpec.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 1/12/16.
//  Copyright © 2016 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTResponseParser.h"

SpecBegin(FTResponseParser)

describe(@"FTResponseParser", ^{
    __block NSArray<FTConference*> *conferences;
    __block NSArray<FTEvent*> *events;
    __block NSArray<FTPresenter*> *presenters;
    __block NSArray<FTVideo*> *videos;
    
    __block NSArray *rawConferences;
    __block NSArray *rawEvents;
    __block NSArray *rawPresenters;
    __block NSArray *rawVideos;
    
    beforeAll(^{
        rawConferences = @[
        @{@"name" : @"Acts as Conference", @"id" : @6, @"event_count" : @1},
        @{@"name" : @"Adhearsion Conf", @"id" : @75, @"event_count" : @2},
        @{@"name" : @"Agile Roots", @"id" : @4, @"event_count" : @2},
        @{@"name" : @"Airbnb Tech Talks", @"id" : @58, @"event_count" : @2},
        @{@"name" : @"Aloha Ruby", @"id" : @38, @"event_count" : @1},
        @{@"name" : @"AltDevConf", @"id" : @59, @"event_count" : @1},
        @{@"name" : @"Alter Conf", @"id" : @111, @"event_count" : @11}
        ];
        
        rawEvents = @[
        @{@"id" : @303, @"display_name" : @"Alter Conf Los Angeles 2015", @"conference" : @"Alter Conf", @"short_code" : @"alterconf2015-los-angeles", @"start_at" : @"2015-11-21T10:30:00.000Z", @"end_at" : @"2015-11-21T15:30:00.000Z"},
        @{@"id" : @322, @"display_name" : @"DockerCon EU 2015", @"conference" : @"DockerCon", @"short_code" : @"Dockerconeu2015", @"start_at" : @"2015-11-15T00:00:00.000Z", @"end_at" : @"2015-11-17T00:00:00.000Z"},
        @{@"id" : @293, @"display_name" : @"Ruby Conference 2015", @"conference" : @"Ruby Conference", @"short_code" : @"rubyconf2015", @"start_at" : @"2015-11-15T00:00:00.000Z", @"end_at" : @"2015-11-17T00:00:00.000Z"}
        ];
        
        rawPresenters = @[
        @{@"id" : @22, @"slug" : @"aaron-bedra", @"first_name" : @"Aaron", @"last_name" : @"Bedra", @"aka_name":[NSNull null], @"twitter_handle" : @"abedra"},
        @{@"id" : @1841, @"slug" : @"harpreet-singh", @"first_name" : @"Harpreet", @"last_name" : @"Singh", @"aka_name" : @"", @"twitter_handle" : @""},
        @{@"id" : @25, @"slug" : @"nathaniel-talbott", @"first_name" : @"Nathaniel", @"last_name" : @"Talbott", @"aka_name" : @"", @"twitter_handle" : @"ntalbott"},
        @{@"id" : @23, @"slug" : @"marcel-molina", @"first_name" : @"Marcel", @"last_name" : @"Molina", @"aka_name" : @"", @"twitter_handle" : @"noradio"},
        @{@"id" : @7, @"slug" : @"gregory-brown", @"first_name" : @"Gregory", @"last_name" : @"Brown", @"aka_name" : @"", @"twitter_handle" : @"practicingruby"},
        @{@"id" : @14, @"slug" : @"james-britt", @"first_name" : @"James", @"last_name" : @"Britt", @"aka_name" : @"", @"twitter_handle" : @"jamesbritt"}
        ];
        
        rawVideos = @[
        @{@"id" : @7194, @"title" : @"Validate Me", @"image" : @"http://s3-us-west-2.amazonaws.com/confreaks-tv3/production/videos/images/000/007/194/Capture-original.PNG?1449180796", @"slug" : @"cssconfeu2014-validate-me", @"recorded_at" : [NSNull null], @"event" : @"CSSConf EU 2014", @"rating" : @"Everyone", @"abstract" : @"As creatives we struggle with fair amount of self-doubt. How do we free ourselves from relying on external validation of our efforts? How do we fight impostor syndrome and confirmation bias? How do we prevent ourselves from falling into the burnout and depression pit, or more importantly how do we recover?\r\n\r\nLessons learned on cutting yourself some slack and surrounding yourself with people who will empower you to do so.", @"post_date" : @"2015-12-03T15:12:00.000Z", @"announce_date" : [NSNull null], @"host" : @"youtube", @"embed_code" : @"ZlxpF9taprI", @"views" : @1, @"views_last_7" : @0, @"views_last_30" : @4, @"license" : @"cc-by-sa-3.0", @"attribution": @"", @"presenters" : @[@{@"first_name" : @"Karolina", @"last_name" : @"Szczur", @"aka_name" : [NSNull null], @"twitter_handle" : @"karolinaszczur"}]},
        @{@"id" : @3225, @"title" : @"Using TDD to Tame the Big Ball o' Mud", @"image" : @"http://s3-us-west-2.amazonaws.com/confreaks-tv3/production/videos/images/000/003/225/brandon_hays-original.png?1422383195", @"slug" : @"mwjs2014-using-tdd-to-tame-the-big-ball-o-mud", @"recorded_at" : @"2014-03-17T17:30:00.000Z", @"event" : @"MountainWest JavaScript 2014", @"rating" : @"Everyone", @"abstract" : @"You have it in your codebase. You’ve tried to clean it up. Heck, you may have written it. It’s the Ball of Mud.\r\nIt didn’t start out that way. You just wanted to add some nice interactive functionality to your website. But then one jQuery plugin turns to three, you add a dash of statefulness, some AJAX error handling, and here you are, unable to sleep at night.\r\nBut your client-side ball of mud can be tamed! We’ll walk through test-driving a refactor until the code is understandable, usable, and extensible.\r\nWe’ll use Ember Components, though the pattern holds for the framework (or no framework) of your choice. It’s time to get excited, not exasperated, when asked to add advanced client-side interactions to your website.", @"post_date" : [NSNull null], @"announce_date" : [NSNull null], @"host" : @"youtube", @"embed_code" : @"GB8pgxoBEBg", @"views" : @11034, @"views_last_7" : @6, @"views_last_30" : @14, @"license" : @"cc-by-sa-3.0", @"attribution" : [NSNull null], @"presenters" : @[@{@"first_name" : @"Brandon", @"last_name" : @"Hays", @"aka_name" : @"", @"twitter_handle" : @"tehviking"}]}
        ];
    });
    
    context(@"when parsing conferences", ^{
        beforeEach(^{
            conferences = [FTResponseParser parseConferences:rawConferences];
        });
        
        it(@"is expected to have correct number of objects", ^{
            expect(conferences).to.haveACountOf(7);
        });
    });
    
    context(@"when parsing events", ^{
        beforeEach(^{
            events = [FTResponseParser parseEvents:rawEvents];
        });
        
        it(@"is expected to have correct number of objects", ^{
            expect(events).to.haveACountOf(3);
        });
    });
    
    context(@"when parsing presenters", ^{
        beforeEach(^{
            presenters = [FTResponseParser parsePresenters:rawPresenters];
        });
        
        it(@"is expected to have correct number of objects", ^{
            expect(presenters).to.haveACountOf(6);
        });
    });
    
    context(@"when parsing videos", ^{
        beforeEach(^{
            videos = [FTResponseParser parseVideos:rawVideos];
        });
        
        it(@"is expected to have correct number of objects", ^{
            expect(videos).to.haveACountOf(2);
        });
    });
});

SpecEnd
