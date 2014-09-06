//
//  FIXViewController.m
//  Pirate Game
//
//  Created by Andrew Bell on 9/3/14.
//  Copyright (c) 2014 Andrew Bell. All rights reserved.
//

#import "FIXViewController.h"
#import "FIXFactory.h"

@interface FIXViewController ()

@end

@implementation FIXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tiles = [[FIXFactory factory]tiles];
    self.character = [[FIXFactory factory]character];
    self.boss = [[FIXFactory factory]boss];
    self.point = CGPointMake(0, 0);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    FIXTile *tile = [[self.tiles objectAtIndex:self.point.x] objectAtIndex:self.point.y];
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Death Message"
                                                           message:@"You have died please restart the game"
                                                          delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    } else if (self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Victory Message"
                                                           message:@"You have defeated the evil pirate boss"
                                                          delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.point = CGPointMake(self.point.x, self.point.y + 1);
    [self updateButtons];
    [self updateTile];
  
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.point = CGPointMake(self.point.x + 1, self.point.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.point = CGPointMake(self.point.x, self.point.y - 1);
    [self updateButtons];
    [self updateTile];
}


- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.point = CGPointMake(self.point.x - 1, self.point.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

-(void)updateTile
{
    FIXTile *tile = [[self.tiles objectAtIndex:self.point.x] objectAtIndex:self.point.y];
    self.storyLabel.text = tile.story;
    self.tileImageView.image = tile.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tile.actionButtonName forState:UIControlStateNormal];
}

-(void)updateButtons
{
    self.westButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.point.x - 1, self.point.y)];
    self.eastButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.point.x + 1, self.point.y)];
    self.northButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.point.x, self.point.y + 1)];
    self.southButton.hidden = [self tilesExistsAtPoint:CGPointMake(self.point.x, self.point.y - 1)];
}

-(BOOL)tilesExistsAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >=0  && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    } else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(FIXArmor *)armor withWeapons:(FIXWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}


@end
