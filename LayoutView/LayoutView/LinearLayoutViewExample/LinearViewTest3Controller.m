

#import "LinearViewTest3Controller.h"
#import "LinearLayoutView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface LinearViewTest3Controller ()

@end

@implementation LinearViewTest3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    LinearLayoutView *rootView = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionVertical width:layoutSizeFill height:layoutSizeFill];
    rootView.backgroundColor = randomColor;
    rootView.lv_margin = 5;
    [self.view addSubview:rootView];
    
    LinearLayoutView *linearView1 = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionHorizontal width:layoutSizeFill height:layoutSizeFill];
    linearView1.backgroundColor = randomColor;
    linearView1.lv_margin = 5;
    linearView1.lv_weight = 1;
    [rootView addSubview:linearView1];
    
    for (int i = 0; i < 3; i++) {
        UILabel *label0 = [UILabel new];
        label0.lv_height = layoutSizeFill;
        label0.lv_margin = 5;
        label0.lv_weight = 1;
        label0.text = [NSString stringWithFormat:@"label%d",i];
        label0.textAlignment = NSTextAlignmentCenter;
        label0.backgroundColor = randomColor;
        [linearView1 addSubview:label0];
    }
    
    LinearLayoutView *linearView2 = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionVertical width:layoutSizeFill height:layoutSizeFill];
    linearView2.backgroundColor = randomColor;
    linearView2.lv_margin = 5;
    linearView2.lv_weight = 1;
    [rootView addSubview:linearView2];
    
    for (int i = 0; i < 3; i++) {
        UILabel *label0 = [UILabel new];
        label0.lv_width = layoutSizeFill;
        label0.lv_margin = 5;
        label0.lv_weight = 1;
        label0.text = [NSString stringWithFormat:@"label%d",i];
        label0.textAlignment = NSTextAlignmentCenter;
        label0.backgroundColor = randomColor;
        [linearView2 addSubview:label0];
    }
    [rootView layout];
}

@end
