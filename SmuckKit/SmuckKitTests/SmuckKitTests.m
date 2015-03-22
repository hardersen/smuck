//
//  SmuckKitTests.m
//  SmuckKitTests
//
//  Created by Trygve Sanne Hardersen on 22/03/15.
//  Copyright (c) 2015 Trygve Sanne Hardersen. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <SmuckKit/SmuckKit.h>

@interface SmuckKitTests : XCTestCase

@end

@implementation SmuckKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSayHello {
    Smuck *smuck = [[Smuck alloc] init];
    NSString *greeting = [smuck sayHello];
    XCTAssertTrue([greeting isEqualToString:@"Hello Smuck!"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
