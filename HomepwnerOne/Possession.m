//
//  Possession.m
//  RandomPossessions
//
//  Created by Kevin Bowe on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Possession.h"


@implementation Possession

@synthesize possessionName, serialNumber, valueInDollars, dateCreated;


- (void)dealloc
{
    [possessionName release];
    [serialNumber release];
    [dateCreated release];
    [super dealloc];
}


- (NSString *)description
{
    // Version ONE...
//    NSString *descriptionSting =
//        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, Recorded on %@",
//         possessionName, serialNumber, valueInDollars, dateCreated];
    
    // Return the new object and set it up for memory management/cleanup...
//    return [descriptionSting autorelease];
    
    
    // Version TWO as convience method. Autorelease is 'built in'...
    return [NSString stringWithFormat:@"%@ (%@): Worth $%d, Recorded on %@",
     possessionName, serialNumber, valueInDollars, dateCreated];
}

- (id)initWithPossessionName:(NSString *)name 
                        valueInDollars:(int)value 
                        serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initializer...
    self = [super init];
    
    // Validate return...
    if (!self) return nil;
    
    
    // Give the instance variables initial values...
    [self setPossessionName:name];
    [self setSerialNumber:sNumber];
    [self setValueInDollars:value];
    dateCreated = [[NSDate alloc] init];
    
    // Return the address of the newly initialized object...
    return self;
}


- (id)initWithPossessionName:(NSString *)name
{
    return [self initWithPossessionName:name 
                                valueInDollars:0 
                                    serialNumber:@""];
}


- (id) init
{
    return [self initWithPossessionName:@"Possestion" 
                                        valueInDollars:0 
                                            serialNumber:@""];
}

+ (id)randomPossession
{
    // Create two arrays with a list of possible adjectives and nouns
    // NOTE: When usinf NSArray's arrayWithObjects:, you can pass as many
    // objects as you like.  At the end of that list, you put nil to
    // signify that there are no more objects - otherwise youwill crash.
    // The nill value is not added to the array, but is used by the method
    // to determine the end of the list...
    
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    // Get the index of a random adjective/noun from the lists
    // NOTE: The % operator, called the modulo operator, gives
    // you the remainder.  So adjectiveIndex is a random number
    // from 0 to 2 inclusive, in this case...
    
    int adjectiveIndex = random() % [randomAdjectiveList count];
    int nounIndex = random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex] ];
    
    int randomValue = random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + random() % 10,
                                    'A' + random() % 26,
                                    '0' + random() % 10,
                                    'A' + random() % 26,
                                    '0' + random() % 10];
    // Once again, ignore the memory problems with this method.
    // We use 'self' insted of the name of the class in class methods...
    // Keep reading to find out why...
    
    Possession *newPossession = 
    [[self alloc] initWithPossessionName:randomName
                            valueInDollars:randomValue  
                                serialNumber:randomSerialNumber];
    
    // Return the new object and set it up for memory management/cleanup...
    return [newPossession autorelease];
    
}



@end
