//
//  ViewController.m
//  SmuckIOS
//
//  Created by Trygve Sanne Hardersen on 22/03/15.
//  Copyright (c) 2015 Trygve Sanne Hardersen. All rights reserved.
//

#import "ViewController.h"

#import <SmuckKit/SmuckKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    Smuck *smuck = [[Smuck alloc] init];
    self.smuck.text = [smuck sayHello];
    
    SmuckIOS *smuckIOS = [[SmuckIOS alloc] init];
    self.smuckIOS.text = [smuckIOS sayHello];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
