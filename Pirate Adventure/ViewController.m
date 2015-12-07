//
//  ViewController.m
//  Pirate Adventure
//
//  Created by Yamusa Dalhatu on 23/11/15.
//  Copyright © 2015 Yamusa Dalhatu. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h" 
#import "Tiles.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    Factory *factory = [[Factory alloc] init];
    self.tiles = [factory tiless];
    self.character = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0, 0);
    [self updateCharacterStatsForArmour:nil withWeapons:nil withHealthEffects:0];
    //NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
    
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    Tiles *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y ];
    if (tile.healthEffects == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    if (self.character.health <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Death message" message:@"You've died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }else if (self.boss.health <= 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Victory message" message:@"You've defeated the evil boss" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    [self updateCharacterStatsForArmour:tile.armour withWeapons:tile.weapon withHealthEffects:tile.healthEffects];
    [self updateTile];

}


- (IBAction)northButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    
    [self updateButtons];
    [self updateTile];

}

- (IBAction)southButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y -1 );
    
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    
    [self updateButtons];
    [self updateTile];

}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    
    [self updateButtons];
    [self updateTile];

}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark method helper

-(void)updateTile{
    
    Tiles *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.weaponLabel.text = self.character.weapon.name;
    self.armorLabel.text = self.character.armour.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
    
    
    
}

-(void)updateButtons{
    
    self.westButton.hidden = [self tilesExistAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tilesExistAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tilesExistAtPoint:CGPointMake(self.currentPoint.y + 1, self.currentPoint.x)];
    self.southButton.hidden = [self tilesExistAtPoint:CGPointMake(self.currentPoint.y - 1, self.currentPoint.x)];
    
}

-(BOOL)tilesExistAtPoint:(CGPoint)point{
    if (point.y >= 0 && point.x >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    else{
        return YES;
    }
}

-(void)updateCharacterStatsForArmour:(Armour *)armour withWeapons:(Weapon *)weapon withHealthEffects:(int)healthEffects{
    if (armour != nil){
        self.character.health = self.character.health - self.character.armour.health + armour.health;
        self.character.armour = armour;
    }
    else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }else if(healthEffects != 0){
        self.character.health = self.character.health + healthEffects;
    }else{
        self.character.health = self.character.health + self.character.armour.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
