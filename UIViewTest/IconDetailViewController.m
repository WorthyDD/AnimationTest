//
//  IconDetailViewController.m
//  UIViewTest
//
//  Created by 武淅 段 on 16/2/2.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "IconDetailViewController.h"
#import "CustomBackSegue.h"
@interface IconDetailViewController ()

@end

@implementation IconDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer *swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backToSuperViewController)];
    swipeGes.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeGes];
}

- (void) backToSuperViewController
{
    [self performSegueWithIdentifier:@"returnSegue1" sender:self];
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"returnSegue1"]){
        CustomBackSegue *mySegue = (CustomBackSegue *)segue;
        
        
        UIView *snap = [self.icon snapshotViewAfterScreenUpdates:NO];
        snap.frame = self.icon.frame;
        mySegue.snapView = snap;
    }
}*/

- (IBAction)returnSegue:(UIStoryboardSegue *)sender
{
    NSLog(@"return segue");
}


@end
