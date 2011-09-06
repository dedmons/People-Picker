//
//  PrePickViewController.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleHolder.h"

@interface PrePickViewController : UIViewController

@property (retain) PeopleHolder *peopleList;
@property (retain) IBOutlet UIButton *makeListButton;
@property (retain) IBOutlet UIButton *addButton;
@property (retain) IBOutlet UIButton *startButton;
@property (retain) IBOutlet UIButton *restartButton;
@property (retain) IBOutlet UITextField *numPeople;
@property (retain) IBOutlet UITextField *personToAdd;

-(IBAction)makeList:(id)sender;
-(IBAction)addPerson:(id)sender;
//-(IBAction)startPicking:(id)sender;
//-(IBAction)restart:(id)sender;

@end
