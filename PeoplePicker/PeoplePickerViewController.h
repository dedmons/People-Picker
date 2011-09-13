//
//  PeoplePickerViewController.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrePickViewController.h"
#import "PickingViewController.h"
#import "InfoViewController.h"

@interface PeoplePickerViewController : UIViewController

@property (retain) PrePickViewController *prePickViewController;
@property (retain) PickingViewController *pickingViewController;
@property (retain) InfoViewController *infoViewController;
@property (copy) NSString *prevView; 

-(IBAction)startPicking:(id)sender;
-(IBAction)reset:(id)sender;
-(IBAction)info:(id)sender;

@end
