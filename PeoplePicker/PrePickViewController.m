//
//  PrePickViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PrePickViewController.h"

@implementation PrePickViewController

@synthesize peopleList,restartButton,makeListButton,addButton,
            startButton,numPeople,personToAdd,addLight,startLight,green,red;

// Used to make the list of people and requires that the size is greater than 0.
//   If the size is less than or equal to 0 an alert is shown. After creating the 
//   list it modifies the apropiate outlets
-(IBAction)makeList:(id)sender{
    NSNumberFormatter *tmp = [[NSNumberFormatter alloc] init];
    if([[self.numPeople text] intValue] == 0){
        // Basic structure for creating a UIAlertView
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Cant Do That"
                                                        message:@"You Must Set The Pool Size" 
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    } else {
        
        [self.numPeople resignFirstResponder]; //Hide Keyboard
        
        if (!peopleList) {
            int cap = [[self.numPeople text] intValue];
            PeopleHolder *tmp = [[PeopleHolder alloc] initWithCap:cap];
            self.peopleList = tmp;
            [tmp release];
        }
        
        [self.restartButton setEnabled:YES];
        [self.addButton setEnabled:YES];
        [self.personToAdd setEnabled:YES];
        [self.addLight setImage:green];
    }
    [tmp release];
}

// Adds person to peopleList if name is not blank and peopleList is not full
-(IBAction)addPerson:(id)sender{
    if ([[self.personToAdd text] length] > 0) {
        if ([self.peopleList countOfPeople] < [[self.numPeople text] intValue]) {
            
            [self.startButton setEnabled:YES];
            [self.startLight setImage:green];
            [self.peopleList addPerson:[self.personToAdd text]];
            [self.personToAdd setText:@""];
            
            NSLog(@"Size of Array: %d",[self.peopleList countOfPeople]);
            
            if([self.peopleList countOfPeople] == [[self.numPeople text] intValue]){
                [self.personToAdd resignFirstResponder];
                [self.addLight setImage:red];
            } 
        } else { //Alert if list is full
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Too Many..." 
                                                            message:@"You Have Reached The Amount Of People You Specified." 
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK" 
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            [self.personToAdd resignFirstResponder];
            [self.personToAdd setText:@""];
            [self.personToAdd setEnabled:NO];
            [self.addButton setEnabled:NO];
            [self.addLight setImage:red];
        }
        
    } else { //Alert if name is blank
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What?" 
                                                        message:@"A Name Cannot Be Blank!" 
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

-(void)releaseOutlets{
    peopleList = nil;
    restartButton = nil;
    makeListButton = nil;
    addButton = nil;
    startButton = nil;
    numPeople = nil;
    personToAdd = nil;
    addLight = nil;
    startLight = nil;
    green = nil;
    red = nil;
}

//Used to hide keyboard if you toutch outside of a UITextField
- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
    for (UIView* view in self.view.subviews) {
        if ([view isKindOfClass:[UITextField class]])
            [view resignFirstResponder];
    }
}

//Used to hide keyboard when return key is hit
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //Sets the numPeople TextField to first responder when view is loaded.
    [self.numPeople becomeFirstResponder];
    
    [super viewDidLoad];
}


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
