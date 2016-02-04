//
//  ThirdViewController.m
//  UIViewTest
//
//  Created by 武淅 段 on 16/1/21.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "ThirdViewController.h"
#import "HandsomeTransition.h"
#import "IconDetailViewController.h"
#import "CustomBackSegue.h"
#import "CustomSegue.h"

@interface ThirdViewController ()

@property (nonatomic) HandsomeTransition *transition;
@property (nonatomic) IconDetailViewController *iconVC;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transition = [[HandsomeTransition alloc]init];
    self.iconVC = [self.storyboard instantiateViewControllerWithIdentifier:@"iconDetail"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapIcon:)];
    [_icon addGestureRecognizer:tap];
    [_icon setUserInteractionEnabled:YES];
    
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didSwipeView:)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeGes];
}

- (void) didTapIcon:(id)sender
{
    [self performSegueWithIdentifier:@"segue1" sender:nil];
}

- (void)didSwipeView : (id)sender
{
    [self performSegueWithIdentifier:@"segue1" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segue1"]){
        CustomSegue *mySegue = (CustomSegue *)segue;
        
        
        UIView *snap = [self.icon snapshotViewAfterScreenUpdates:NO];
        snap.frame = self.icon.frame;
        mySegue.snapView = snap;
    }
}


- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
    if([identifier isEqualToString:@"returnSegue1"]){
        CustomBackSegue *segue = [[CustomBackSegue alloc]initWithIdentifier:identifier source:fromViewController destination:toViewController];
        return segue;
    }
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}

- (IBAction)viewControllerUnwindSegue:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"back segue--%@",unwindSegue.identifier);
}


@end
