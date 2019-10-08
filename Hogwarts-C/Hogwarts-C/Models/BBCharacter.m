//
//  BBCharacter.m
//  Hogwarts-C
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "BBCharacter.h"

// Magic Strings
// k is for key
static NSString * const kName = @"name";
static NSString * const kHouse = @"house";
static NSString * const kbloodStatus = @"bloodStatus";
static NSString * const kdeathEater = @"deathEater";
static NSString * const kRole = @"role";

@implementation BBCharacter

- (BBCharacter *)initWithName:(NSString *)name house:(NSString *)house bloodStatus:(NSString *)bloodStatus deathEater:(BOOL)deathEater role:(NSString *)role
{
    self = [super init];
    if (self)
    {
        _name = name;
        _house = house;
        _bloodStatus = bloodStatus;
        _deathEater = deathEater;
        _role = role;
    }
    return self;
}

@end

@implementation BBCharacter (JSONConvertable)

- (BBCharacter *)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[kName];
    NSString *house = dictionary[kHouse];
    NSString *bloodStatus = dictionary[kbloodStatus];
    // USE BOOL VALUE
    BOOL deathEater = [dictionary[kdeathEater] boolValue];
    NSString *role = dictionary[kRole];
    return [self initWithName:name house:house bloodStatus:bloodStatus deathEater:deathEater role:role];
}

@end
