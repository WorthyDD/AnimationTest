//
//  MyView.m
//  UIViewTest
//
//  Created by 武淅 段 on 16/1/21.
//  Copyright © 2016年 武淅 段. All rights reserved.
//

#import "MyView.h"
#import "MyCALayer.h"

@implementation MyView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self drawMyCALayer];
}


-(void)drawRect:(CGRect)rect{
    NSLog(@"2-drawRect:");
    NSLog(@"CGContext:%@",UIGraphicsGetCurrentContext());//得到的当前图形上下文正是drawLayer中传递的
    [super drawRect:rect];
    
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"1-drawLayer:inContext:");
    NSLog(@"CGContext:%@",ctx);
    [super drawLayer:layer inContext:ctx];
    
}


- (void)drawMyCALayer
{
    MyCALayer *layer=[[MyCALayer alloc]init];
    layer.bounds=CGRectMake(0, 0, 185, 185);
    layer.position=CGPointMake(90,90);
    layer.backgroundColor=[UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    
    //显示图层
    [layer setNeedsDisplay];
    
    [self.layer addSublayer:layer];
}


@end
