//
//  PeopleHolder.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Clemson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleHolder : NSObject

@property (retain) NSMutableArray *people;

-(NSString *)randomPerson;
-(void)addPerson:(NSString *)newGuy;

@end
