//
//  PlayingCard.h
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (copy, nonatomic) NSString *suit; //花色
@property (assign, nonatomic) NSUInteger rank; //大小

+ (NSArray *)validSuit;
+ (NSUInteger)maxRank;

@end
