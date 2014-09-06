//
//  FIXFactory.m
//  Pirate Game
//
//  Created by Andrew Bell on 9/4/14.
//  Copyright (c) 2014 Andrew Bell. All rights reserved.
//

#import "FIXFactory.h"
#import "FIXTile.h"

@implementation FIXFactory

+(instancetype)factory
{
    static FIXFactory *factory;
    
    // Do I need to create a factory
    if (!factory) {
        factory = [[self alloc]initPrivate];
    }
    
    return factory;
}

// If a programmer calls [[FIXFactory alloc]init], let them know the error of their ways
-(instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[FIXFactory factory]"];
    return nil;
}

// Here is the real (secret) initializer
-(instancetype)initPrivate
{
    self = [super init];
    
    return self;
}

-(NSArray *)tiles
{
    FIXTile *tile1 = [[FIXTile alloc]init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake a voyage.  You just stop the evil pirate Boss.  Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Take sword";
    FIXWeapon *bluntedSword = [[FIXWeapon alloc]init];
    bluntedSword.name = @"Blunted sword";
    bluntedSword.damage = 15;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take the sword";
    
    FIXTile *tile2 = [[FIXTile alloc]init];
    tile2.story = @"You have come across an armory.  Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    FIXArmor *steelArmor = [[FIXArmor alloc]init];
    steelArmor.name = @"Steel armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take armor";
    
    
    FIXTile *tile3 = [[FIXTile alloc]init];
    tile3.story = @"A mysterious dock appears on the horizon.  Should we stopo and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at the dock";
    
    FIXTile *tile4 = [[FIXTile alloc]init];
    tile4.story = @"You have found a parrot.  This can be used in your armor slot.  Parrots are a great defender and a fiercly loyal to their captain!";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    FIXArmor *parrotArmor = [[FIXArmor alloc]init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.actionButtonName = @"Adopt Parrot";
    
    FIXTile *tile5 = [[FIXTile alloc]init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons.  Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    FIXWeapon *pistol = [[FIXWeapon alloc]init];
    pistol.name = @"Pistol";
    pistol.damage = 17;
    tile5.actionButtonName = @"Use pistol";
    
    FIXTile *tile6 = [[FIXTile alloc]init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Show no fear";
    
    FIXTile *tile7 = [[FIXTile alloc]init];
    tile7.story = @"You have sighted a pirate battle off the coast.  Should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those scum";
    
    FIXTile *tile8 = [[FIXTile alloc]init];
    tile8.story = @"The legend of the deep. The might kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abondon ship";
    
    
    FIXTile *tile9 = [[FIXTile alloc]init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasure";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take treasure";
    
    FIXTile *tile10 = [[FIXTile alloc]init];
    tile10.story = @"A group of pirates attemps to board your ship.";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Repel the invaders";
    
    FIXTile *tile11 = [[FIXTile alloc]init];
    tile11.story = @"In the deep of the sea many things live and many things can be found.  Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim deeper";
    
    FIXTile *tile12 = [[FIXTile alloc]init];
    tile12.story = @"Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight";
    
    NSArray *column1Array = [[NSArray alloc]initWithObjects:tile1, tile2, tile3, nil];
    NSArray *column2Array = [[NSArray alloc]initWithObjects:tile4, tile5, tile6, nil];
    NSArray *column3Array = [[NSArray alloc]initWithObjects:tile7, tile8, tile9, nil];
    NSArray *column4Array = [[NSArray alloc]initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tilesArray = [[NSArray alloc]initWithObjects:column1Array, column2Array, column3Array, column4Array,nil];
    
    return tilesArray;
}

-(FIXCharacter *)character
{
    FIXCharacter *character = [[FIXCharacter alloc]init];
    character.health = 100;
    FIXArmor *armor = [[FIXArmor alloc]init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    FIXWeapon *weapon = [[FIXWeapon alloc]init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(FIXBoss *)boss
{
    FIXBoss *boss = [[FIXBoss alloc]init];
    boss.health = 65;
    return boss;
}

@end
