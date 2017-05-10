//
//  CardMatchingGame.h
//  STFCardPlay
//
//  Created by likai on 2017/5/9.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

- (instancetype)initWithCardCount: (NSUInteger)count usingDeck: (Deck *)deck;
- (void)chooseCardAtIndex: (NSUInteger)index;
- (Card *)cardAtIndex: (NSUInteger)index;

@end
