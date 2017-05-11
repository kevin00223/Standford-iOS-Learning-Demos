
//
//  PlayingCard.m
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard ()
//{
//    NSString *_suit;
//}

@end

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *)validSuit
{
    return @[@"♣", @"♠", @"♥", @"♦"];
}

+ (NSArray *)rankStrs
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
    return [PlayingCard rankStrs].count - 1;
}

//重写get方法
- (NSString *)contents
{
//    return [NSString stringWithFormat:@"%@%lu", self.suit, (unsigned long)self.rank];
    NSArray *rankStrs = [PlayingCard rankStrs];
    
    return [rankStrs[self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuit] containsObject:suit]){
        _suit = suit;
    }
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1){
//        PlayingCard *otherCard = otherCards.firstObject;
        id card = otherCards.firstObject; // 做id类型的判断
        if ([card isKindOfClass:[PlayingCard class]])
        {
            PlayingCard *otherCard = (PlayingCard *)card; //类型强转: id cast to PlayingCard *
            if ([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            }else if(self.rank == otherCard.rank){
                score = 4;
            }
        }
    }
    
    return score;
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}



@end
