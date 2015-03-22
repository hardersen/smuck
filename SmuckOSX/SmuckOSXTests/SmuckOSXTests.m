//
//  SmuckOSXTests.m
//  SmuckOSXTests
//
//  Created by Trygve Sanne Hardersen on 22/03/15.
//  Copyright (c) 2015 Trygve Sanne Hardersen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import "ViewController.h"

@interface SmuckOSXTests : XCTestCase

@end

@implementation SmuckOSXTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewController {
    NSStoryboard *storyboard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyboard instantiateControllerWithIdentifier:@"viewController"];
    [viewController view];
    
    XCTAssertTrue([viewController.smuck.stringValue isEqualToString:@"Hello Smuck!"]);
    XCTAssertTrue([viewController.smuckOSX.stringValue isEqualToString:@"Hello MacSmuck!"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
