//
//  FlipBoardViewController.m
//  FlipBoard
//
//  Created by cia209™ on 3/2/14.
//  Copyright (c) 2014 cia209™. All rights reserved.
//

#import "FlipBoardViewController.h"

@interface FlipBoardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipCountLabel;   //showing the flipCount
@property (nonatomic) int flipCount;        // counting the fliping been done
@property (weak, nonatomic) IBOutlet UIProgressView *flipProgress;
@property (weak, nonatomic) IBOutlet UIButton *flipButton;

@end




@implementation FlipBoardViewController

- (IBAction)clearCount:(UILongPressGestureRecognizer *)sender {
    self.flipCount = 0;
    [self.flipProgress setProgress:self.flipCount animated:YES];
    
    self.flipCountLabel.text = [NSString stringWithFormat: @"Flips: %d ", self.flipCount];
    NSLog(@"the flipCount has been changed to: %d",self.flipCount);
}




- (IBAction)flip:(UIButton *)sender {
    if([sender.currentTitle isEqualToString:@""]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"BoardBack"]
                          forState:UIControlStateNormal];
        
        [sender setTitle:@" "
                forState:UIControlStateNormal];
        
        self.flipProgress.hidden = NO;
        self.flipCountLabel.text = [NSString stringWithFormat: @"Flips: %d ", ++self.flipCount];
        [self.flipProgress setProgress:self.flipCount*0.01 animated:YES];
        NSLog(@"the flipCount has been changed to: %d",self.flipCount);
    }
    else {
        [sender setBackgroundImage:[UIImage imageNamed:@"BoardFront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@""
                forState:UIControlStateNormal];
        
        self.flipProgress.hidden = NO;
        self.flipCountLabel.text = [NSString stringWithFormat: @"Flips: %d ", ++self.flipCount];
        [self.flipProgress setProgress:self.flipCount*0.01 animated:YES];
        //self.flipProgress.progress = self.flipCount*0.01;
        NSLog(@"the flipCount has been changed to: %d",self.flipCount);
    }
    
    if(self.flipCount == 100)
    {
        self.flipCount = 0;
    }
    
}

@end
