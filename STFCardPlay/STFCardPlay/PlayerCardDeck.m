//
//  PlayerCardDeck.m
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "PlayerCardDeck.h"
#import "PlayingCard.h"

@implementation PlayerCardDeck

- (instancetype)init
{
    self = [super init];
    if (self){
        for (NSString *suit in [PlayingCard validSuit]) {
            for (NSUInteger rank = 0; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                
                [self addCard:card];
            }
        }
        
    }
    return self;
}

@end
