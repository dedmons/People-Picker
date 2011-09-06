//
//  PeopleHolder.h
//  PeoplePicker
//
//  Created by Douglas Edmonson on 9/5/11.
//  Copyright 2011 Douglas Edmonson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PeopleHolder : NSObject

@property (retain) NSMutableArray *people;

-(id)initWithCap:(NSInteger)cap;
-(NSString *)randomPerson;
-(void)addPerson:(NSString *)newGuy;
-(NSInteger)countOfPeople;

@end
