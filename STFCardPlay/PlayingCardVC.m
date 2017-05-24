//
//  PlayingCardVC.m
//  STFCardPlay
//
//  Created by likai on 2017/5/24.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "PlayingCardVC.h"

@interface PlayingCardVC ()

@end

@implementation PlayingCardVC

- (Deck *)createDeck
{
    return [[PlayerCardDeck alloc]init];
}

@end
