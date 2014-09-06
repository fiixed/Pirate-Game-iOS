//
//  FIXFactory.h
//  Pirate Game
//
//  Created by Andrew Bell on 9/4/14.
//  Copyright (c) 2014 Andrew Bell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FIXTile.h"
#import "FIXCharacter.h"
#import "FIXBoss.h"



@interface FIXFactory : NSObject

+(instancetype)factory;

-(NSArray *)tiles;
-(FIXCharacter *)character;
-(FIXBoss *)boss;







@end
