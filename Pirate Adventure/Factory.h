//
//  Factory.h
//  Pirate Adventure
//
//  Created by Yamusa Dalhatu on 24/11/15.
//  Copyright © 2015 Yamusa Dalhatu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
//#import "Weapon.h"
#import "Boss.h"

@interface Factory : NSObject

-(NSArray *)tiless;
-(Character *)character;
@property (strong, nonatomic) Boss *boss;

@end
