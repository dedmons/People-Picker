//
//  PeoplePickerViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PeoplePickerViewController.h"

@implementation PeoplePickerViewController

@synthesize prePickViewController,pickingViewController,infoViewController,prevView;

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
        [pVC release];
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
    
    [self.pickingViewController resetView];
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
    [pPVC release];
    
    [UIView commitAnimations];
}

-(IBAction)info:(id)sender{
    if (!self.infoViewController) {
        InfoViewController *iVC = [[InfoViewController alloc] initWithNibName:@"InfoView" bundle:nil];
        self.infoViewController = iVC;
        [iVC release];
    }
    if ([sender tag] == 24) {
        [UIView beginAnimations:@"View Flip" context:nil];
        [UIView setAnimationDuration:1.25];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:
         UIViewAnimationTransitionCurlDown
                               forView:self.view cache:YES];
        
        [self.prePickViewController.view removeFromSuperview];
        [self.view insertSubview:self.infoViewController.view atIndex:0];
        
        [UIView commitAnimations];
        prevView = @"PrePick";
    } else if ([sender tag] == 25) {
        [UIView beginAnimations:@"View Flip" context:nil];
        [UIView setAnimationDuration:1.25];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:
         UIViewAnimationTransitionCurlDown
                               forView:self.view cache:YES];
        
        [self.pickingViewController.view removeFromSuperview];
        [self.view insertSubview:self.infoViewController.view atIndex:0];
        
        [UIView commitAnimations];
        prevView = @"Picking";
    } else if ([sender tag] == 26) {
        if ([prevView isEqualToString:@"Picking"]) {
            [UIView beginAnimations:@"View Flip" context:nil];
            [UIView setAnimationDuration:1.25];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationTransition:
             UIViewAnimationTransitionCurlUp
                                   forView:self.view cache:YES];
            
            [self.infoViewController.view removeFromSuperview];
            [self.view insertSubview:self.pickingViewController.view atIndex:0];
            
            [UIView commitAnimations];
        } else if ([prevView isEqualToString:@"PrePick"]){
            [UIView beginAnimations:@"View Flip" context:nil];
            [UIView setAnimationDuration:1.25];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [UIView setAnimationTransition:
             UIViewAnimationTransitionCurlUp
                                   forView:self.view cache:YES];
            
            [self.infoViewController.view removeFromSuperview];
            [self.view insertSubview:self.prePickViewController.view atIndex:0];
            
            [UIView commitAnimations];
        }
    }
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
