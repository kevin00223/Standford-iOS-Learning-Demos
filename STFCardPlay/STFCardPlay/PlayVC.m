//
//  PlayVC.m
//  STFCardPlay
//
//  Created by likai on 2017/5/5.
//  Copyright © 2017年 yinbake. All rights reserved.
//

#import "PlayVC.h"
#import "PlayerCardDeck.h"
#import "Deck.h"
#import "PlayerCardDeck.h"
#import "Card.h"

@interface PlayVC ()
@property (weak, nonatomic) IBOutlet UILabel *FlipCount;
@property (assign, nonatomic) NSUInteger flipNum;
@property (strong, nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UIButton *cardBtn;

@end

@implementation PlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.cardBtn.titleLabel.text = [self.deck drawRandomCard].contents;
//    self.cardBtn.titleLabel.font = [UIFont systemFontOfSize:28];
//    self.cardBtn.titleLabel.textColor = [UIColor blackColor];
//    [self.cardBtn setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
//    self.cardBtn.titleLabel.font = [UIFont systemFontOfSize:28];
//    
}

- (Deck *)deck
{
    if (!_deck){
        _deck = [self createDeck];
    }
    return _deck;
}

//- (void)viewDidLayoutSubviews
//{
//    [self.cardBtn setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
//    self.cardBtn.titleLabel.font = [UIFont systemFontOfSize:28];
//}

//- (UIButton *)cardBtn
//{
//    if (!_cardBtn){
//        [self.cardBtn setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
//        self.cardBtn.titleLabel.font = [UIFont systemFontOfSize:28];
//    }
//    return _cardBtn;
//}

- (Deck *)createDeck
{
    return [[PlayerCardDeck alloc]init];
}

- (IBAction)cardClickBtn:(UIButton *)sender {
    
    Card *card = [self.deck drawRandomCard];
    
    if ([sender.currentTitle length]){
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    }else{
        if (card)
        {
            [sender setTitle:card.contents forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"front"] forState:UIControlStateNormal];
        }
    }
    
    self.flipNum++;
    //self.FlipCount.text = [NSString stringWithFormat:@"FlipCount: %lu", (unsigned long)self.flipNum];
}

- (void)setFlipNum:(NSUInteger)flipNum
{
    _flipNum = flipNum;
    self.FlipCount.text = [NSString stringWithFormat:@"FlipCount: %lu", (unsigned long)self.flipNum];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    PlayerCardDeck *playCD = [[PlayerCardDeck alloc]init];
//    NSLog(@"%@", [playCD drawRandomCard].contents);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
