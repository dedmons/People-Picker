//
//  PeoplePickerAppDelegate.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeoplePickerViewController;

@interface PeoplePickerAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PeoplePickerViewController *viewController;

@end
