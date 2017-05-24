//
//  PlayVC.h
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerCardDeck.h"

@interface PlayVC : UIViewController

//abstract method   for subclass
//抽象类的方法 用来返回不同类型的卡牌
- (Deck *)createDeck;

@end
