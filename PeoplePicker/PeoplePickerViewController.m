//
//  PeoplePickerViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PeoplePickerViewController.h"

@implementation PeoplePickerViewController

@synthesize prePickViewController,pickingViewController;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)startPicking:(id)sender{
    if (!pickingViewController) {
        PickingViewController *pVC = [[PickingViewController alloc] initWithNibName:@"PickingView" 
                                                                             bundle:nil];
        self.pickingViewController = pVC;
    }
    
    self.pickingViewController.peopleList = self.prePickViewController.peopleList;
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromRight
                           forView:self.view cache:YES];
    
    [self.prePickViewController.view removeFromSuperview];
    [self.view insertSubview:self.pickingViewController.view atIndex:0];
    
    [UIView commitAnimations];
}

-(IBAction)reset:(id)sender{
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    PrePickViewController *pPVC = [[PrePickViewController alloc] 
                                   initWithNibName:@"PrePickView" bundle:nil];
    
    [UIView setAnimationTransition:
     UIViewAnimationTransitionFlipFromRight
                           forView:self.view cache:YES];
    
    [[self.view.subviews objectAtIndex:0] removeFromSuperview];
    self.prePickViewController = pPVC;
    [self.view insertSubview:pPVC.view atIndex:0];
    
    [UIView commitAnimations];
    
    [pPVC release];
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    PrePickViewController *pPVC = [[PrePickViewController alloc] 
                                   initWithNibName:@"PrePickView" bundle:nil];
    self.prePickViewController = pPVC;
    [self.view insertSubview:pPVC.view atIndex:0];
    [pPVC release];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.prePickViewController = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
