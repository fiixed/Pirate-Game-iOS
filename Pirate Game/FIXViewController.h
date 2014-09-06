//
//  FIXViewController.h
//  Pirate Game
//
//  Created by Andrew Bell on 9/3/14.
//  Copyright (c) 2014 Andrew Bell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FIXCharacter.h"
#import "FIXBoss.h"


@interface FIXViewController : UIViewController

@property (strong, nonatomic) NSArray *tiles;
@property (nonatomic) CGPoint point;
@property (strong, nonatomic) FIXCharacter *character;
@property (strong, nonatomic) FIXBoss *boss;

@property (strong, nonatomic) IBOutlet UIImageView *tileImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;



@end
