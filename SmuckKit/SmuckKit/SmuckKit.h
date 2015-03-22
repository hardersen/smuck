//
//  SmuckKit.h
//  SmuckKit
//
//  Created by Trygve Sanne Hardersen on 22/03/15.
//  Copyright (c) 2015 Trygve Sanne Hardersen. All rights reserved.
//

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#elif TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#endif

//! Project version number for SmuckKit.
FOUNDATION_EXPORT double SmuckKitVersionNumber;

//! Project version string for SmuckKit.
FOUNDATION_EXPORT const unsigned char SmuckKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SmuckKit/PublicHeader.h>

#import <SmuckKit/Smuck.h>

#if TARGET_OS_IPHONE
#import <SmuckKit/SmuckKitIOS.h>
#elif TARGET_OS_MAC
#import <SmuckKit/SmuckKitOSX.h>
#endif
