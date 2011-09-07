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
    NSString *tmp;
    if ([people count] > 0) {
        NSNumber *rand = [NSNumber numberWithInt:(arc4random() % [people count])];
        tmp = [NSString stringWithString:[self.people objectAtIndex:[rand intValue]]];
        [self.people removeObjectAtIndex:[rand intValue]];
    } else {
        tmp = @"-1";
    }
    
    return tmp;
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
