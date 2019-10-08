//
//  BBCharacterController.h
//  Hogwarts-C
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBCharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBCharacterController : NSObject

// If we were doing a shared instance:
// +(BBCharacter *)sharedInstance;

// Make a static func rather than a singleton
// All closures in objc are escaping
// ^ means block
+(void)fetchCharacters:(void(^)(NSArray<BBCharacter *>*characters))completion;

// completion(arrayOfDictionary: [Dictionary]) -> Void

@end

NS_ASSUME_NONNULL_END
