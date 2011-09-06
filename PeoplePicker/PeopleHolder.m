//
//  PeopleHolder.m
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import "PeopleHolder.h"

@implementation PeopleHolder

@synthesize people;

-(NSInteger)countOfPeople{
    return [people count];
}

-(NSString *)randomPerson{
    return @"test";
}

-(void)addPerson:(NSString *)newGuy{
    [self.people addObject:newGuy];
}

- (id)initWithCap:(NSInteger)cap
{
    self = [super init];
    if (self) {
        self.people = [[NSMutableArray alloc] initWithCapacity:cap];
    }
    
    return self;
}

-(void)dealloc{
    [self.people release];
    [super dealloc];
}

@end
