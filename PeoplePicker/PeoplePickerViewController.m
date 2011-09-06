//
//  PeoplePickerViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PeoplePickerViewController.h"

@implementation PeoplePickerViewController

@synthesize prePickViewController;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)startPicking:(id)sender{
    NSLog(@"picking started");
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
