//
//  FIXTile.h
//  Pirate Game
//
//  Created by Andrew Bell on 9/4/14.
//  Copyright (c) 2014 Andrew Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FIXWeapon.h"
#import "FIXArmor.h"

@interface FIXTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) FIXWeapon *weapon;
@property (strong, nonatomic) FIXArmor *armor;
@property (nonatomic) int healthEffect;

@end
