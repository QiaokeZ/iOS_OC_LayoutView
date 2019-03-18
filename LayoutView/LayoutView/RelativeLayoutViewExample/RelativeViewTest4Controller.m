//
//  RelativeViewTest4Controller.m
//  LayoutView
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019 com.etraffic.EasyCharging. All rights reserved.
//

#import "RelativeViewTest4Controller.h"
#import "RelativeLayoutView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface RelativeViewTest4Controller ()

@end

@implementation RelativeViewTest4Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    RelativeLayoutView *rootView = [[RelativeLayoutView alloc]initWithWidth:layoutSizeFill height:layoutSizeFill];
    rootView.backgroundColor = randomColor;
    rootView.lv_margin = 10;
    [self.view addSubview:rootView];
    
    UILabel *label = [UILabel new];
    label.lv_width = 100;
    label.lv_margin = 10;
    label.lv_height = 100;
    label.lv_alignParent = LayoutAlignParentTop | LayoutAlignParentLeft;
    label.text = @"label";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = randomColor;
    [rootView addSubview:label];
    
    UILabel *label1 = [UILabel new];
    label1.lv_width = 100;
    label1.lv_margin = 10;
    label1.lv_height = 100;
    label1.lv_alignParent = LayoutAlignParentTop | LayoutAlignParentRight;
    label1.text = @"label1";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = randomColor;
    [rootView addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.lv_width = 100;
    label2.lv_margin = 10;
    label2.lv_height = 100;
    label2.lv_alignParent = LayoutAlignParentBottom | LayoutAlignParentLeft;
    label2.text = @"label2";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = randomColor;
    [rootView addSubview:label2];
    
    UILabel *label3 = [UILabel new];
    label3.lv_width = 100;
    label3.lv_margin = 10;
    label3.lv_height = 100;
    label3.lv_alignParent = LayoutAlignParentBottom | LayoutAlignParentRight;
    label3.text = @"label3";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.backgroundColor = randomColor;
    [rootView addSubview:label3];
    
    [rootView layout];
}

@end
