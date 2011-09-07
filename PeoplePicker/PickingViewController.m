//
//  PickingViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/6/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PickingViewController.h"

@implementation PickingViewController

@synthesize pickButton,resetButton,peopleList,numToPick;

-(IBAction)pickPeople:(id)sender{
//    if ([self.peopleList countOfPeople] > 0) {
//        NSLog(@"List Size: %d",[self.peopleList countOfPeople]);
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your Person Is..."
//                                                        message:[self.peopleList randomPerson]
//                                                       delegate:nil 
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//        [alert release];
//    }
    NSString *person = [self.peopleList randomPerson];
    if ([person isEqualToString:@"-1"]) {
        
        NSLog(@"Empty Array");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your Person Is..."
                                                        message:@"Nobody! The List Is Empty"
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK :("
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
        [self.pickButton setEnabled:NO];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your Person Is..."
                                                        message:person
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    NSLog(@"%@",person);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
