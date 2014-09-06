//
//  FIXCharacter.h
//  Pirate Game
//
//  Created by Andrew Bell on 9/6/14.
//  Copyright (c) 2014 Andrew Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FIXWeapon.h"
#import "FIXArmor.h"


@interface FIXCharacter : NSObject

@property (strong, nonatomic) FIXWeapon *weapon;
@property (strong, nonatomic) FIXArmor *armor;
@property (nonatomic) int health;
@property (nonatomic) int damage;



@end
