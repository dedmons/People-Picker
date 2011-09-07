//
//  PickingViewController.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/6/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleHolder.h"

@interface PickingViewController : UIViewController

@property (retain) PeopleHolder *peopleList;
@property (retain) IBOutlet UITextField *numToPick;
@property (retain) IBOutlet UIButton *pickButton;
@property (retain) IBOutlet UIButton *resetButton;

-(IBAction)pickPeople:(id)sender;

@end
