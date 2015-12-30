//
//  LZXViewController.m
//  HMGLTransitionsMyDemo
//
//  Created by LZXuan on 15-1-26.
//  Copyright (c) 2015年 LZXuan. All rights reserved.
//

#import "LZXViewController.h"
#import "DoorsTransition.h"
#import "HMGLTransitionManager.h"

@interface LZXViewController ()
{
    UIView *_parentView;
    UIImageView *_imageView0;
    UIImageView *_imageView1;
}
@end

@implementation LZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_parentView = [[UIView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    [self.view addSubview:_parentView];
    
    _imageView0 = [[UIImageView alloc] initWithFrame:_parentView.bounds];
    [_imageView0 setImage:[UIImage imageNamed:@"image0.png"]];
    [_parentView addSubview:_imageView0];
    
    // 加image1
    _imageView1 = [[UIImageView alloc] initWithFrame:_parentView.bounds];
    [_imageView1 setImage:[UIImage imageNamed:@"image1.png"]];
    [_parentView addSubview:_imageView1];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(110, 400, 100, 50);
    [button setTitle:@"hmgl" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)btnClick:(UIButton *)button {
    //HMGLTransitions 是一个非arc的库
    
    // 使用HMGL做3D变换
    // OpenGLES.framework  xcode5之后可以不导
    // QuartzCore.framework
    // DoorsTransition.h
    // HMGLTransitionManager.h
    
    DoorsTransition *door = [[DoorsTransition alloc] init];
    [door setTransitionType:DoorsTransitionTypeClose];
    // DoorsTransitionTypeOpen DoorsTransitionTypeClose
    // 初始化了一个具体Door动作
    HMGLTransitionManager *manager = [HMGLTransitionManager sharedTransitionManager];
    
    // 设置使用哪个动画转场
    [manager setTransition:door];
    // 对parentView进行动画
    [manager beginTransition:_parentView];
    
    //把子视图的层次改变一下
    
    [_parentView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    [manager commitTransition];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
