//
//  RelativeViewTest5Controller.m
//  LayoutView
//
//  Created by admin on 2019/3/18.
//  Copyright © 2019 com.etraffic.EasyCharging. All rights reserved.
//

#import "RelativeViewTest5Controller.h"
#import "RelativeLayoutView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface RelativeViewTest5Controller ()

@end

@implementation RelativeViewTest5Controller

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
    label.lv_width = 220;
    label.lv_margin = 10;
    label.lv_height = 220;
    label.lv_gravity = LayoutGravityCenter;
    label.text = @"label";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = randomColor;
    [rootView addSubview:label];

    UILabel *label1 = [UILabel new];
    label1.lv_width = 70;
    label1.lv_height = 70;
    label1.lv_alignLeft = label;
    label1.lv_toTopOf = label;
    label1.text = @"label1";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = randomColor;
    [rootView addSubview:label1];

    UILabel *label2 = [UILabel new];
    label2.lv_width = 70;
    label2.lv_height = 70;
    label2.lv_alignRight = label;
    label2.lv_toTopOf = label;
    label2.text = @"label2";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = randomColor;
    [rootView addSubview:label2];

    UILabel *label3 = [UILabel new];
    label3.lv_width = 70;
    label3.lv_height = 70;
    label3.lv_alignLeft = label;
    label3.lv_toBottomOf = label;
    label3.text = @"label3";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.backgroundColor = randomColor;
    [rootView addSubview:label3];

    UILabel *label4 = [UILabel new];
    label4.lv_width = 70;
    label4.lv_height = 70;
    label4.lv_alignRight = label;
    label4.lv_toBottomOf = label;
    label4.text = @"label4";
    label4.textAlignment = NSTextAlignmentCenter;
    label4.backgroundColor = randomColor;
    [rootView addSubview:label4];

    UILabel *label5 = [UILabel new];
    label5.lv_width = 70;
    label5.lv_height = 70;
    label5.lv_margin = 10;
    label5.lv_alignLeft = label;
    label5.lv_alignTop = label;
    label5.text = @"label5";
    label5.textAlignment = NSTextAlignmentCenter;
    label5.backgroundColor = randomColor;
    [rootView addSubview:label5];

    UILabel *label6 = [UILabel new];
    label6.lv_width = 70;
    label6.lv_height = 70;
    label6.lv_margin = 10;
    label6.lv_alignRight = label;
    label6.lv_alignTop = label;
    label6.text = @"label6";
    label6.textAlignment = NSTextAlignmentCenter;
    label6.backgroundColor = randomColor;
    [rootView addSubview:label6];

    UILabel *label7 = [UILabel new];
    label7.lv_width = 70;
    label7.lv_height = 70;
    label7.lv_margin = 10;
    label7.lv_alignLeft = label;
    label7.lv_alignBottom = label;
    label7.text = @"label7";
    label7.textAlignment = NSTextAlignmentCenter;
    label7.backgroundColor = randomColor;
    [rootView addSubview:label7];

    UILabel *label8 = [UILabel new];
    label8.lv_width = 70;
    label8.lv_height = 70;
    label8.lv_margin = 10;
    label8.lv_alignRight = label;
    label8.lv_alignBottom = label;
    label8.text = @"label8";
    label8.textAlignment = NSTextAlignmentCenter;
    label8.backgroundColor = randomColor;
    [rootView addSubview:label8];

    [rootView layout];
}

@end
