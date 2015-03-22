//
//  SmuckIOSTests.m
//  SmuckIOSTests
//
//  Created by Trygve Sanne Hardersen on 22/03/15.
//  Copyright (c) 2015 Trygve Sanne Hardersen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ViewController.h"

@interface SmuckIOSTests : XCTestCase

@end

@implementation SmuckIOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    [viewController view];
    
    XCTAssertTrue([viewController.smuck.text isEqualToString:@"Hello Smuck!"]);
    XCTAssertTrue([viewController.smuckIOS.text isEqualToString:@"Hello iSmuck!"]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
