//
//  CardMatchingGame.m
//  STFCardPlay
//
//  Created by likai on 2017/5/9.
//  Copyright © 2017年 yinbake. All rights reserved.
//

static const int CARDMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, copy) NSMutableArray *cards;

@end

@implementation CardMatchingGame



- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init]; //检查父类是否初始化成功 不成功返回nil
    if(self){
        for (int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (card){ //判断当deck中的卡牌全部抽完 返回nil时
                [self.cards addObject:card];
            }
        }
    }
    return self;
}


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index]; //取到选中的卡牌: 如果选中的牌已经跟其他牌match了 就do nothing!!!!!
    if (!card.isMatched){ //如果选中的卡牌跟其他牌不match
        if (card.isChosen){ //如果卡牌已经被选中过了 就设置为未选中
            card.chosen = NO;
        }else{ //数字相同比花色相同的分数高
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match: @[otherCard]];
                    if (matchScore){ //不返回nil 说明有分 说明匹配上了
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES; //跳出循环的条件
                    }else{
                        self.score -= CARDMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; //如果找到match的了 就跳出循环
                }
            }
            self.score -= COST_TO_CHOOSE; //每次翻牌消耗的分值??
            
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    //通过index从数组中取值 需要判断index是个正常值 即: 如果index小于数组中元素个数 则返回对应的元素 否则返回nil
    return index < [self.cards count] ? self.cards[index] : nil;
}

//懒加载
- (NSMutableArray *)cards
{
    if (!_cards){
        _cards = [NSMutableArray array];
    }
    return _cards;
}

@end
