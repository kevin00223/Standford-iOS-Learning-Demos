//
//  Deck.h
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop: (BOOL)atTop;
- (void)addCard: (Card *)card;

- (Card *)drawRandomCard;

@end
