//
//  Character.h
//  Pirate Adventure
//
//  Created by Yamusa Dalhatu on 02/12/15.
//  Copyright © 2015 Yamusa Dalhatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armour.h"
#import "Weapon.h"

@interface Character : NSObject

@property (nonatomic, strong) Armour *armour;
@property (nonatomic, strong) Weapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
