//
//  Deck.m
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "Deck.h"

@interface Deck ()

@property (copy, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:false];
}

- (Card *)drawRandomCard
{
    Card *randomCard; //值为nil
    
    if([self.cards count]){ //如果数组里没值 在通过index取值时 就会数组越界
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
//        [self.cards removeObjectAtIndex:index];
        [self.cards removeObject:randomCard];
    }
    
    return randomCard;
}

//懒加载 -- 如果不对对象初始化 所有OC中的对象 初始值都是0/nil, 初始化后可以保证数组是存在的 最多数组为空而已
- (NSMutableArray *)cards
{
    if (_cards == nil){
        _cards = [NSMutableArray array];
    }
    return _cards;
}

@end
