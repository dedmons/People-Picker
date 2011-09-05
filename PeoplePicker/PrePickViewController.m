//
//  PrePickViewController.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Clemson. All rights reserved.
//

#import "PrePickViewController.h"

@implementation PrePickViewController

@synthesize peopleList,restartButton,makeListButton,addButton,startButton,numPeople,personToAdd;


-(IBAction)makeList:(id)sender{
    if (!peopleList) {
        int cap = [[sender stringValue] intValue];
        self.peopleList = [NSMutableArray arrayWithCapacity:cap];
        [self.makeListButton setEnabled:NO];
        [self.restartButton setEnabled:YES];
        [self.addButton setEnabled:YES];
    }
}

-(IBAction)addPerson:(id)sender{
    
}

-(IBAction)startPicking:(id)sender{
    
}
   
-(IBAction)restart:(id)sender{
    
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
