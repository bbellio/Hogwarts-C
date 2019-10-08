//
//  BBCharacterController.m
//  Hogwarts-C
//
//  Created by Bethany Wride on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "BBCharacterController.h"
#import "BBCharacter.h"

// Magic strings
static NSString * const kBaseURLString = @"https://www.potterapi.com/v1/";
static NSString * const kCharacterString = @"characters";
static NSString * const kApiKey = @"key";
static NSString * const kApiKeyValue = @"$2a$10$ipHhcp4crl6up4vfXxBV4us/OYeh52SKjlaKOTWC4rjLCJlYW1hNS";

@implementation BBCharacterController

// Shared instance - change h file to say instancetype
//+ (instancetype)sharedInstance
//{
//    static BBCharacterController *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[BBCharacterController alloc] init];
//    });
//    return sharedInstance;
//}

// Make sure this is nullable so we can pass in nil
+ (void)fetchCharacters:(void (^)(NSArray<BBCharacter *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL *characterURL = [baseURL URLByAppendingPathComponent:kCharacterString];
    NSURLQueryItem *apiQueryItem = [NSURLQueryItem queryItemWithName:kApiKey value:kApiKeyValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:characterURL resolvingAgainstBaseURL:true];
    urlComponents.queryItems = @[apiQueryItem];
    NSURL *finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // If !error = nil (shorthand)
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            // Same error memory address
            // Options can also be 2 because it's the third option in an enumeration (i.e index 2)
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing JSON: %@", error);
                completion(nil);
                return;
            }
            
            // Place for characters to go once they're decoded (landing zone)
            // Only one level deep - no need to make any extra dictionaries
            NSMutableArray *characterArray = [NSMutableArray new];
            
            // Loops through TLD and initializes each character with a dictionary
            for (NSDictionary *characterDictionary in topLevelDictionary)
            {
                BBCharacter *decodedCharacter = [[BBCharacter alloc] initWithDictionary:characterDictionary];
                [characterArray addObject:decodedCharacter];
            }
            completion(characterArray);
        }
    }]resume];
}

@end
