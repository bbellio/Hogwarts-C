//
//  BBCharacter.h
//  Hogwarts-C
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBCharacter : NSObject

// MARK: - Properties
@property(nonatomic, copy, readonly)NSString *name;
@property(nonatomic, copy, readonly, nullable)NSString *house;
@property(nonatomic, copy, readonly)NSString *bloodStatus;
@property(nonatomic, readonly)BOOL deathEater;
@property(nonatomic, copy, readonly)NSString *role;

-(BBCharacter *)initWithName:(NSString *)name
                       house:(NSString *)house
                 bloodStatus:(NSString *)bloodStatus
                  deathEater:(BOOL)deathEater
                        role:(NSString *)role;

@end

// InitWithDictionary to be able to pull a character from the API in extension
// Class extension written with @interface ClassToBeExtended (ExtensionName)
@interface BBCharacter (JSONConvertable)

// id means any object in Obj C; dictionary of string: any
-(BBCharacter *)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
