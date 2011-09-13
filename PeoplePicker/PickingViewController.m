//
//  PickingViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/6/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PickingViewController.h"

@implementation PickingViewController

@synthesize pickButton,resetButton,peopleList,numToPick,peopleLeft,green,red;

//Picks a random person from list of people
-(IBAction)pickPeople:(id)sender{
    
    NSInteger numOfGroup = [[self.numToPick text] integerValue];
    NSString *result = @"";
    NSString *nextResult = @"";
    BOOL emptyList = NO;
    
    //Loop to get number of people specified
    for (int i = 0; i < numOfGroup && !emptyList; i++) {
        NSLog(@"Picking personn %d out of %d",i,numOfGroup);
        nextResult = [self.peopleList randomPerson];
        if ([nextResult isEqualToString:@"-1"]) {
            NSLog(@"no more people");
            [self.pickButton setImage:red forState:UIControlStateNormal];
            emptyList = YES;
        } else {
            result = [result stringByAppendingFormat:@"%@\n",nextResult];
        }
    }
    [self updateNumPeople];
    
    if ([self.peopleList countOfPeople] == 0) {
        [self.pickButton setImage:red forState:UIControlStateNormal];
    }
    
    //Creates the alerts based upon group size and number of people left
    if (numOfGroup == 1 && ![result isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your Person Is..."
                                                        message:result 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    } else if (numOfGroup > 1 && ![result isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The Group Is..."
                                                        message:result 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    //Alert if no one is left
    if ([[self.peopleLeft text] isEqualToString:@"0"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"There Is No One Left"
                                                        message:@"Plese press the reset button and enter a new group" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    NSLog(@"Group: %@",result);
}

//Updates the number of people left in view
-(void)updateNumPeople{
    [self.peopleLeft setText:[NSString stringWithFormat:@"%d",[self.peopleList countOfPeople]]];
}

//Resets the view to default state
-(void)resetView{
    [self.pickButton setEnabled:YES];
    [self.pickButton setImage:green forState:UIControlStateNormal];
    [self.numToPick setText:@"1"];
    [self updateNumPeople];
}

//Hides keyboard when touch is outside of a text field
- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
            [view resignFirstResponder];
    }
}

-(void)releaseOutlets{
    pickButton = nil;
    resetButton = nil;
    peopleList = nil;
    numToPick = nil;
    peopleLeft = nil;
    green = nil;
    red = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        green = [[UIImage alloc] initWithContentsOfFile:
                 [[NSBundle mainBundle] pathForResource:@"green.png" ofType:@""]]; 
        red = [[UIImage alloc] initWithContentsOfFile:
               [[NSBundle mainBundle] pathForResource:@"red.png" ofType:@""]];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    [self releaseOutlets];
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self releaseOutlets];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
