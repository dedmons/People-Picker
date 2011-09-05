//
//  PrePickViewController.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Clemson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleHolder.h"

@interface PrePickViewController : UIViewController

@property (retain) PeopleHolder *peopleList;
@property UIButton *makeListButton;
@property UIButton *addButton;
@property UIButton *startButton;
@property UIButton *restartButton;
@property UITextView *numPeople;
@property UITextView *personToAdd;

-(IBAction)makeList:(id)sender;
-(IBAction)addPerson:(id)sender;
-(IBAction)startPicking:(id)sender;
-(IBAction)restart:(id)sender;

@end
