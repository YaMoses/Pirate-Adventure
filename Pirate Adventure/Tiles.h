//
//  Tiles.h
//  Pirate Adventure
//
//  Created by Yamusa Dalhatu on 24/11/15.
//  Copyright © 2015 Yamusa Dalhatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armour.h"
@import UIKit;

@interface Tiles : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong , nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armour *armour;
@property (nonatomic) int healthEffects;

@end
