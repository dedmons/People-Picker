//
//  PrePickViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PrePickViewController.h"

@implementation PrePickViewController

@synthesize peopleList,restartButton,makeListButton,addButton,startButton,numPeople,personToAdd;


-(IBAction)makeList:(id)sender{
    NSNumberFormatter *tmp = [[NSNumberFormatter alloc] init];
    if([[self.numPeople text] intValue] == 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Really??"
                                                        message:@"Do you really want to pick from no one?" 
                                                       delegate:nil 
                                              cancelButtonTitle:@"Nope" 
                                              otherButtonTitles:@"Sure", nil];
        [alert show];
        [alert release];
    } else {
        [self.numPeople resignFirstResponder];
        if (!peopleList) {
            int cap = [[self.numPeople text] intValue];
            self.peopleList = [[PeopleHolder alloc] initWithCap:cap];
        }
        [self.restartButton setEnabled:YES];
        [self.addButton setEnabled:YES];
        [self.personToAdd setEnabled:YES];
    }
    [tmp release];
}

-(IBAction)addPerson:(id)sender{
    if ([[self.personToAdd text] length] > 0) {
        if ([self.peopleList countOfPeople] < [[self.numPeople text] intValue]) {
            [self.startButton setEnabled:YES];
            [self.peopleList addPerson:[self.personToAdd text]];
            [self.personToAdd setText:@""];
            NSLog(@"Size of Array: %d",[self.peopleList countOfPeople]);
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"To Many..." 
                                                            message:@"You Have Reached The Ammount Of People You Specified." 
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK" 
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"What?" 
                                                        message:@"A Name Cannot Be Blank!" 
                                                       delegate:nil
                                              cancelButtonTitle:@"OK" 
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
