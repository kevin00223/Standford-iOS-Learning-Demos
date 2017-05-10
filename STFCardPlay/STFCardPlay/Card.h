//
//  Card.h
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (copy, nonatomic) NSString *contents;
@property (assign, nonatomic, getter=isMatched) BOOL matched;
@property (assign, nonatomic, getter=isChosen) BOOL chosen;

- (int)match: (NSArray *)otherCards;

@end
