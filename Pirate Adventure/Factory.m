//
//  Factory.m
//  Pirate Adventure
//
//  Created by Yamusa Dalhatu on 24/11/15.
//  Copyright © 2015 Yamusa Dalhatu. All rights reserved.
//

#import "Factory.h"
#import "Tiles.h"

@implementation Factory

-(NSArray *)tiless{
    
    Tiles *tile1 = [[Tiles alloc] init];
           tile1.story = @"Captain, we need a fearless leader such as yourself to undetake a voyage. You just stop the evil Pirate boss, would you like a blunted sword to get started?";
    Weapon *bluntedSword = [[Weapon alloc] init];
    bluntedSword.name = @"Blunted sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Take sword";
    
    Tiles *tile2 = [[Tiles alloc] init];
    tile2.story = @"You have come to an armoury, would you like to upgrade your armour to a steel armour?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    Armour *steelArmour = [[Armour alloc] init];
    steelArmour.name = @"Steel armour";
    steelArmour.health = 8;
    tile2.armour = steelArmour;
    tile2.actionButtonName = @"Take armour";
    
    Tiles *tile3 = [[Tiles alloc] init];
    tile3.story = @"A mysterious dock appeared on the horizon, should we stop and ask for directions?";
    tile3.healthEffects = 12;
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.actionButtonName = @"Stop at the dock";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];

    Tiles *tile4 = [[Tiles alloc] init];
    tile4.story = @"You've found a parrot, this can be used in your armour slot as parrots are a great defender and fiercely loyal to captain";
    Armour *parrotArmour = [[Armour alloc] init];
    parrotArmour.name = @"Parrot";
    parrotArmour.health = 20;
    tile4.armour = parrotArmour;
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile4.actionButtonName = @"Adopt parrot";
    

    Tiles *tile5 = [[Tiles alloc] init];
    tile5.story = @"You've stumped upon a cache of pirate weapons, would you like to upgrade to a pistol?";
    Weapon *pistolWeapon = [[Weapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile5.actionButtonName = @"Use pistol";
    

    Tiles *tile6 = [[Tiles alloc] init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.healthEffects = -22;
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.actionButtonName = @"Show no fear";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];

    Tiles *tile7 = [[Tiles alloc] init];
    tile7.story = @"You've sighted a pirate ship off coast, should we intervene?";
    tile7.healthEffects = 8;
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.actionButtonName = @"Fight those scum";
    

    Tiles *tile8 = [[Tiles alloc] init];
    tile8.story = @"The legend of the deep, the mighty Kraken appears";
    tile8.healthEffects = - 46;
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.actionButtonName = @"Abandon ship";
    

    Tiles *tile9 = [[Tiles alloc] init];
    tile9.story = @"You've stumbled upon a hidden cave of  pirate treasurer";
    tile9.healthEffects = 20;
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile5.actionButtonName = @"Take treasure";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];

    Tiles *tile10 = [[Tiles alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship";
    tile10.healthEffects = -15;
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.actionButtonName = @"Repel the evaders";
    

    Tiles *tile11 = [[Tiles alloc] init];
    tile11.story = @"In the depth of the sea, many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.healthEffects = -7;
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.actionButtonName = @"Swim deep";
    

    Tiles *tile12 = [[Tiles alloc] init];
    tile12.story = @"Your final faceoff with the fearless captain";
    tile12.healthEffects = -15;
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Fight";

    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles =  [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;

}

-(Character *)character{
    
    Character *character = [[Character alloc] init];
    character.health = 100;
    Armour *armour = [[Armour alloc] init];
    armour.name = @"Cloak";
    armour.health = 5;
    
    character.armour = armour;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"fist";
    weapon.damage = 5;
    
    character.weapon = weapon;
    
    return character;
}

-(Boss *)boss{
    Boss *boss = [[Boss alloc] init];
    boss.health = 65;
    return boss;
    
}
@end
