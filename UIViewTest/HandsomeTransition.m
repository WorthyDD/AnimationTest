//
//  HandsomeTransition.m
//  UIViewTest
//
//  Created by 武淅 段 on 16/2/2.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "HandsomeTransition.h"
#import "ThirdViewController.h"
#import "IconDetailViewController.h"
#define ANIMATION_TIME 1.0

@implementation HandsomeTransition


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return ANIMATION_TIME;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 可以看做为destination ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 可以看做为source ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 添加toView到容器上
    [[transitionContext containerView] addSubview:toViewController.view];
    
    

    ThirdViewController *vc = (ThirdViewController*)fromViewController;
    UIImageView *icon = vc.icon;
//    toViewController.view.alpha = 0.0;
//    vc.icon.alpha = 0.0;
    [toViewController.view addSubview:icon];
    icon.frame = vc.icon.frame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        // 动画效果有很多,这里就展示个左偏移
//        fromViewController.view.transform = CGAffineTransformMakeRotation(M_PI);
        
        
        icon.center = toViewController.view.center;
        icon.transform = CGAffineTransformMakeScale(2.0, 2.0);
        toViewController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束-->记住，一定别忘了在过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
