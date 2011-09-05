//
//  PeopleHolder.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Clemson. All rights reserved.
//

#import "PeopleHolder.h"

@implementation PeopleHolder

@synthesize people;

- (id)init
{
    self = [super init];
    if (self) {
        self.people = [NSMutableArray arrayWithCapacity:10];
    }
    
    return self;
}

@end
