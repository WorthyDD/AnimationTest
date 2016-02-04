//
//  CustomSegue.m
//  UIViewTest
//
//  Created by 武淅 段 on 16/2/4.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "CustomSegue.h"
#import "ThirdViewController.h"
#import "IconDetailViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation CustomSegue


- (void)perform
{
    /*
    UIView *view1 = self.sourceViewController.view;
    UIView *view2 = self.destinationViewController.view;
    
//    view2.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow insertSubview:view2 aboveSubview:view1];
    
    ThirdViewController *vc = (ThirdViewController*)self.sourceViewController;
    UIImageView *icon = vc.icon;
    CGRect frame = icon.frame;
    NSLog(@"[%f,%f]",frame.origin.x,frame.origin.y);
    //    toViewController.view.alpha = 0.0;
    //    vc.icon.alpha = 0.0;
//    [view2 addSubview:icon];
    view2.alpha = 0.0;
    [UIView animateWithDuration:1.0 animations:^{
        // 动画效果有很多,这里就展示个左偏移
        //        fromViewController.view.transform = CGAffineTransformMakeRotation(M_PI);
        
        icon.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
        
        icon.transform = CGAffineTransformMakeScale(2.0, 2.0);
        view2.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        
        [self.sourceViewController.navigationController pushViewController:self.destinationViewController animated:NO];
        NSLog(@"[%f,%f]",icon.frame.origin.x,icon.frame.origin.y);
        
        icon.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
        [view2 addSubview:icon];
    }];
    */
    
    
    /*
    [UIView animateWithDuration:1.0 animations:^{
       
        view1.frame = CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        view2.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    } completion:^(BOOL finished) {
//        [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:nil];
        [self.sourceViewController.navigationController pushViewController:self.destinationViewController animated:NO];
    }];*/
    
    
    
    NSLog(@"snap--%@",_snapView);
    ThirdViewController *vc1 = self.sourceViewController;
    IconDetailViewController *vc2 = self.destinationViewController;
    
    [[UIApplication sharedApplication].keyWindow insertSubview:vc2.view aboveSubview:vc1.view];
    [[UIApplication sharedApplication].keyWindow addSubview:_snapView];
    
    vc2.view.alpha = 0;
    vc2.icon.hidden = YES;
    vc1.icon.hidden = YES;
    [UIView animateWithDuration:1.0 animations:^{
        
        _snapView.center = vc2.view.center;
        _snapView.transform = CGAffineTransformMakeScale(2.0, 2.0);
        vc2.view.alpha = 1;
    } completion:^(BOOL finished) {
        [_snapView removeFromSuperview];
        vc1.icon.hidden = NO;
        vc2.icon.hidden = NO;
        [vc1.navigationController pushViewController:vc2 animated:NO];
    }];
}
@end
