//
//  ViewController.m
//  SmuckOSX
//
//  Created by Trygve Sanne Hardersen on 22/03/15.
//  Copyright (c) 2015 Trygve Sanne Hardersen. All rights reserved.
//

#import "ViewController.h"

#import <SmuckKit/SmuckKit.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    Smuck *smuck = [[Smuck alloc] init];
    self.smuck.stringValue = [smuck sayHello];
    
    SmuckOSX *smuckOSX = [[SmuckOSX alloc] init];
    self.smuckOSX.stringValue = [smuckOSX sayHello];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
