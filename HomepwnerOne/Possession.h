//
//  Possession.h
//  RandomPossessions
//
//  Created by Kevin Bowe on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Possession : NSObject {
// @private
   
    NSString *possessionName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

- (id)initWithPossessionName:(NSString *)name 
              valueInDollars:(int)value 
                serialNumber:(NSString *)sNumber;

- (id)initWithPossessionName:(NSString *)name;

+ randomPossession;

@end
