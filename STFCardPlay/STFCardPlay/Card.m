//
//  Card.m
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *otherCard in otherCards){
        if ([otherCard.contents isEqualToString:self.contents]){ //比较卡牌的内容 如果传进来的卡跟选中的卡内容相同
            score = 1;
        }
    }
    return score;
}

@end
