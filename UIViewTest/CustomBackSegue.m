//
//  CustomBackSegue.m
//  UIViewTest
//
//  Created by 武淅 段 on 16/2/4.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "CustomBackSegue.h"
#import "ThirdViewController.h"
#import "IconDetailViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation CustomBackSegue


- (void)perform
{
    
    IconDetailViewController *vc1 = self.sourceViewController;
    ThirdViewController *vc2 = self.destinationViewController;
    
    UIView *snap = [vc1.icon snapshotViewAfterScreenUpdates:NO];
    snap.frame = vc1.icon.frame;
    _snapView = snap;
    
    [[UIApplication sharedApplication].keyWindow insertSubview:vc2.view aboveSubview:vc1.view];
    [[UIApplication sharedApplication].keyWindow addSubview:_snapView];
   
    
    
    vc2.view.alpha = 0;
    vc2.icon.hidden = YES;
    vc1.icon.hidden = YES;
    [UIView animateWithDuration:1.0 animations:^{
        
        _snapView.center = vc2.icon.center;
        _snapView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        vc2.view.alpha = 1;
    } completion:^(BOOL finished) {
        [_snapView removeFromSuperview];
        vc1.icon.hidden = NO;
        vc2.icon.hidden = NO;
        [vc1.navigationController popViewControllerAnimated:NO];
    }];

}
@end
