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

-(IBAction)pickPeople:(id)sender{
    NSInteger numOfGroup = [[self.numToPick text] integerValue];
    NSString *result = @"";
    NSString *nextResult = @"";
    
    BOOL emptyList = NO;
    
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
    } else {
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

-(void)updateNumPeople{
    [self.peopleLeft setText:[NSString stringWithFormat:@"%d",[self.peopleList countOfPeople]]];
}

-(void)resetView{
    [self.pickButton setEnabled:YES];
    [self.pickButton setImage:green forState:UIControlStateNormal];
    [self.numToPick setText:@"1"];
    [self updateNumPeople];
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
            [view resignFirstResponder];
    }
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
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
