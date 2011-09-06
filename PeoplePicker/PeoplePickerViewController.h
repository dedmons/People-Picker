//
//  PeoplePickerViewController.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrePickViewController.h"


@interface PeoplePickerViewController : UIViewController

@property (retain) PrePickViewController *prePickViewController;

-(IBAction)startPicking:(id)sender;

@end
