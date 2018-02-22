//
//  FTVideoSpec.m
//  ConfreaksMTV
//
//  Created by Dima Kostenich on 10/25/15.
//  Copyright © 2015 Anton Kostenich. All rights reserved.
//

#import "SpecHelper.h"
#import "FTVideo.h"

SpecBegin(FTVideo)

describe(@"FTVideo", ^{
    __block FTVideo *video;
    __block NSDictionary *videosJsonFormat;
    __block NSDateFormatter *dateFormatter;
    
    beforeAll(^{
        videosJsonFormat = @{@"id" : @1287, @"title" : @"Y Not -- Adventures in Functional Programming", @"image" : @"http://s3-us-west-2.amazonaws.com/confreaks-tv3/production/videos/images/000/001/287/1287-rubyconf2012-y-not-adventures-in-functional-programming-thumb_0004-original.png?1422314013", @"slug" : @"rubyconf2012-y-not-adventures-in-functional-programming", @"recorded_at" : @"2012-11-02T16:20:00.000Z", @"event" : @"Ruby Conference 2012", @"rating" : @"Everyone", @"abstract" : @"One of the deepest mysteries in the functional programming world is the Y-Combinator. Many have heard of it, but few have mastered its mysteries. Although fairly useless in real world software, understanding how the Y-Combinator works and why it is important gives the student an important insight into the nature of functional programming.\r\n\r\nJoin with us on this journey of understanding. Be prepared to curry your functions and bind your lambdas as we delve into the whys and wherefores of this paragon of functional programming. Although you will probably never have a need for the combinator, the effort put forth to understand it will improve your functional programming chops. This talk is not for the faint of heart, but the successful student will be richly rewarded.\r\n\r\nAlso, you will understand why \"Y-Combinator\" is the perfect name for Paul Graham's start-up funding company.", @"post_date" : @"2012-11-10T08:00:00.000Z", @"announce_date" : [NSNull null], @"host" : @"youtube", @"embed_code" : @"FITJMJjASUs", @"views" : @70454, @"views_last_7" : @62, @"views_last_30" : @283, @"license" : @"cc-by-sa-3.0", @"attribution" : [NSNull null], @"presenters" : @[@{@"first_name" : @"Daniel P.", @"last_name" : @"Friedman", @"aka_name" : @"", @"twitter_handle" : @"jimweirich"}, @{@"first_name" : @"Enrique Comba", @"last_name" : @"Riepenhausen", @"aka_name" : @"", @"twitter_handle" : @"lol"}]};
        
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    });
    
    beforeEach(^{
        video = [[FTVideo alloc] initWithParams:videosJsonFormat];
    });
        
    it(@"is expected to return correct id", ^{
        expect(video.videoId).to.equal(@1287);
    });
    
    it(@"is expected to return correct slug", ^{
        expect(video.slug).to.equal(@"rubyconf2012-y-not-adventures-in-functional-programming");
    });
    
    it(@"is expected to return correct title", ^{
        expect(video.title).to.equal(@"Y Not -- Adventures in Functional Programming");
    });

    it(@"is expected to return correct image url", ^{
        expect(video.image).to.equal(@"http://s3-us-west-2.amazonaws.com/confreaks-tv3/production/videos/images/000/001/287/1287-rubyconf2012-y-not-adventures-in-functional-programming-thumb_0004-original.png?1422314013");
    });
    
    it(@"is expected to return correct 'recorded at' date/time", ^{
        NSDate *dateToCompareWith = [dateFormatter dateFromString:@"2012-11-02T16:20:00.000Z"];
        expect(video.recordedAt).to.equal(dateToCompareWith);
    });
    
    it(@"is expected to return correct event", ^{
        expect(video.event).to.equal(@"Ruby Conference 2012");
    });
    
    it(@"is expected to return correct rating", ^{
        expect(video.rating).to.equal(@"Everyone");
    });
    
    it(@"is expected to return correct abstract", ^{
        expect(video.abstract).to.equal(@"One of the deepest mysteries in the functional programming world is the Y-Combinator. Many have heard of it, but few have mastered its mysteries. Although fairly useless in real world software, understanding how the Y-Combinator works and why it is important gives the student an important insight into the nature of functional programming.\r\n\r\nJoin with us on this journey of understanding. Be prepared to curry your functions and bind your lambdas as we delve into the whys and wherefores of this paragon of functional programming. Although you will probably never have a need for the combinator, the effort put forth to understand it will improve your functional programming chops. This talk is not for the faint of heart, but the successful student will be richly rewarded.\r\n\r\nAlso, you will understand why \"Y-Combinator\" is the perfect name for Paul Graham's start-up funding company.");
    });
    
    it(@"is expected to return correct post date/time", ^{
        NSDate *dateToCompareWith = [dateFormatter dateFromString:@"2012-11-10T08:00:00.000Z"];
        expect(video.postDate).to.equal(dateToCompareWith);
    });
    
    it(@"is expected to return correct announce date/time", ^{
        expect(video.announceDate).to.beNil();
    });
    
    it(@"is expected to return correct host", ^{
        expect(video.host).to.equal(@"youtube");
    });
    
    it(@"is expected to return correct embed code", ^{
        expect(video.embedCode).to.equal(@"FITJMJjASUs");
    });
    
    it(@"is expected to return correct number of views", ^{
        expect(video.views).to.equal(@70454);
    });
    
    it(@"is expected to return correct number of views in last 7 days", ^{
        expect(video.viewsLast7).to.equal(@62);
    });
    
    it(@"is expected to return correct number of views in last 30 days", ^{
        expect(video.viewsLast30).to.equal(@283);
    });
    
    it(@"is expected to return correct license", ^{
        expect(video.license).to.equal(@"cc-by-sa-3.0");
    });
    
    it(@"is expected to return correct attribution", ^{
        expect([video.attribution class]).to.equal([NSNull class]);
    });
    
    it(@"is expected to return correct presenters #1", ^{
        expect(video.presentersSlug[0]).to.equal(@"Daniel-P-Friedman");
    });
    
    it(@"is expected to return correct presenter #2", ^{
        expect(video.presentersSlug[1]).to.equal(@"Enrique-Comba-Riepenhausen");
    });
});

SpecEnd
