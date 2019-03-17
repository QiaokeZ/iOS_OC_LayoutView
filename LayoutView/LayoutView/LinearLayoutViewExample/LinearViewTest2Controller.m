//
//  LinearViewTest2Controller.m
//  LayoutView
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019 com.etraffic.EasyCharging. All rights reserved.
//

#import "LinearViewTest2Controller.h"
#import "LinearLayoutView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface LinearViewTest2Controller ()

@end

@implementation LinearViewTest2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    LinearLayoutView *rootView = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionHorizontal width:layoutSizeFill height:layoutSizeFill];
    rootView.backgroundColor = randomColor;
    rootView.lv_margin = 5;
    [self.view addSubview:rootView];
    
    UILabel *label0 = [UILabel new];
    label0.lv_height = layoutSizeFill;
    label0.lv_margin = 5;
    label0.lv_weight = 1;
    label0.text = @"label0";
    label0.textAlignment = NSTextAlignmentCenter;
    label0.backgroundColor = randomColor;
    [rootView addSubview:label0];
    
    UILabel *label1 = [UILabel new];
    label1.lv_height = layoutSizeFill;
    label1.lv_margin = 5;
    label1.lv_weight = 1;
    label1.text = @"label1";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = randomColor;
    [rootView addSubview:label1];

    UILabel *label2 = [UILabel new];
    label2.lv_width = 50;
    label2.lv_margin = 5;
    label2.lv_height = 50;
    label2.text = @"label2";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = randomColor;
    [rootView addSubview:label2];

    UILabel *label3 = [UILabel new];
    label3.lv_width = 50;
    label3.lv_margin = 5;
    label3.lv_height = 50;
    label3.lv_gravity = LayoutGravityCenter;
    label3.text = @"label3";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.backgroundColor = randomColor;
    [rootView addSubview:label3];

    UILabel *label4 = [UILabel new];
    label4.lv_width = 50;
    label4.lv_margin = 5;
    label4.lv_height = 50;
    label4.lv_gravity = LayoutGravityBottom;
    label4.text = @"label4";
    label4.textAlignment = NSTextAlignmentCenter;
    label4.backgroundColor = randomColor;
    [rootView addSubview:label4];
    
    [rootView layout];
}

@end
