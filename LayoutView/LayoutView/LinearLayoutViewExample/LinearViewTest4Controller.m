
#import "LinearViewTest4Controller.h"
#import "LinearLayoutView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface LinearViewTest4Controller ()

@end

@implementation LinearViewTest4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    LinearLayoutView *rootView = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionVertical
                                                             contentGravity:LinearLayoutContentGravityCenter
                                                                      width:layoutSizeFill
                                                                     height:layoutSizeFill];
    rootView.backgroundColor = randomColor;
    rootView.lv_marginTop= 10;
    rootView.lv_marginLeft= 5;
    rootView.lv_marginBottom= 10;
    rootView.lv_marginRight= 5;
    [self.view addSubview:rootView];
    
    LinearLayoutView *linearView2 = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionVertical width:layoutSizeFill height:layoutSizeFill];
    linearView2.backgroundColor = randomColor;
    linearView2.lv_margin = 5;
    linearView2.lv_weight = 1;
    [rootView addSubview:linearView2];
    
    LinearLayoutView *linearView3 = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionHorizontal width:layoutSizeFill height:layoutSizeFill];
    linearView3.backgroundColor = randomColor;
    linearView3.lv_margin = 5;
    linearView3.lv_weight = 1;
    [linearView2 addSubview:linearView3];
    
    LinearLayoutView *linearView4 = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionHorizontal width:layoutSizeFill height:layoutSizeFill];
    linearView4.backgroundColor = randomColor;
    linearView4.lv_margin = 5;
    linearView4.lv_weight = 2;
    [linearView3 addSubview:linearView4];
    
    for (int i = 0; i < 3; i++) {
        UILabel *label0 = [UILabel new];
        label0.lv_height = layoutSizeFill;
        label0.lv_margin = 5;
        label0.lv_weight = 1;
        label0.text = [NSString stringWithFormat:@"label%d",i];
        label0.textAlignment = NSTextAlignmentCenter;
        label0.backgroundColor = randomColor;
        [linearView4 addSubview:label0];
    }
    
    LinearLayoutView *linearView5 = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionVertical width:layoutSizeFill height:layoutSizeFill];
    linearView5.backgroundColor = randomColor;
    linearView5.lv_margin = 5;
    linearView5.lv_weight = 1;
    [linearView3 addSubview:linearView5];
    
    for (int i = 0; i < 3; i++) {
        UILabel *label0 = [UILabel new];
        label0.lv_width = layoutSizeFill;
        label0.lv_margin = 5;
        label0.lv_weight = 1;
        label0.text = [NSString stringWithFormat:@"label%d",i];
        label0.textAlignment = NSTextAlignmentCenter;
        label0.backgroundColor = randomColor;
        [linearView5 addSubview:label0];
    }
    
    [rootView layout];
}

@end
