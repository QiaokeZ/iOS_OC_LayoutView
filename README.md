# LayoutView(仿Android布局)
## 快速、简单、方便的UI布局框架
## 简书：https://www.jianshu.com/p/bc22145f4eaf
## swift版本：https://github.com/QiaokeZ/iOS_Swift_LayoutView

### LinearLayoutView 使用

```swift
<!--上下布局-->
LinearLayoutView *rootView = [[LinearLayoutView alloc]initWithDirection:LinearLayoutDirectionVertical width:layoutSizeFill height:layoutSizeFill];
rootView.backgroundColor = randomColor;
rootView.lv_margin = 5;
[self.view addSubview:rootView];

UILabel *label0 = [UILabel new];
label0.lv_width = layoutSizeFill;
label0.lv_margin = 5;
label0.lv_weight = 1;
label0.text = @"label0";
label0.textAlignment = NSTextAlignmentCenter;
label0.backgroundColor = randomColor;
[rootView addSubview:label0];

UILabel *label1 = [UILabel new];
label1.lv_width = layoutSizeFill;
label1.lv_margin = 5;
label1.lv_weight = 1;
label1.text = @"label1";
label1.textAlignment = NSTextAlignmentCenter;
label1.backgroundColor = randomColor;
[rootView addSubview:label1];

UILabel *label2 = [UILabel new];
label2.lv_width = 100;
label2.lv_margin = 5;
label2.lv_height = 100;
label2.text = @"label2";
label2.textAlignment = NSTextAlignmentCenter;
label2.backgroundColor = randomColor;
[rootView addSubview:label2];

UILabel *label3 = [UILabel new];
label3.lv_width = 100;
label3.lv_margin = 5;
label3.lv_height = 100;
label3.lv_gravity = LayoutGravityCenter;
label3.text = @"label3";
label3.textAlignment = NSTextAlignmentCenter;
label3.backgroundColor = randomColor;
[rootView addSubview:label3];

UILabel *label4 = [UILabel new];
label4.lv_width = 100;
label4.lv_margin = 5;
label4.lv_height = 100;
label4.lv_gravity = LayoutGravityRight;
label4.text = @"label4";
label4.textAlignment = NSTextAlignmentCenter;
label4.backgroundColor = randomColor;
[rootView addSubview:label4];

[rootView layout];
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0acm5bdljj30n01dsdiu.jpg" width="30%" height="50%"/>

```swift
<!--左右布局-->
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
```
<img src="https://ws2.sinaimg.cn/large/006tKfTcgy1g0acmpwzx5j30n01ds41w.jpg" width="30%" height="50%"/>

```swift
<!--混合布局-->
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
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0acsoiruwj30n01dsgpj.jpg" width="30%" height="50%"/>

```swift
<!--多层嵌套布局-->
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
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0e35xr46wj30n01ds424.jpg" width="30%" height="50%"/>


### RelativeLayoutView 使用
```swift
RelativeLayoutView *rootView = [[RelativeLayoutView alloc]initWithWidth:layoutSizeFill height:layoutSizeFill];
rootView.backgroundColor = randomColor;
rootView.lv_margin = 10;
[self.view addSubview:rootView];

UILabel *label1 = [UILabel new];
label1.lv_width = 100;
label1.lv_margin = 10;
label1.lv_height = 100;
label1.lv_gravity = LayoutGravityCenterVertical;
label1.text = @"label1";
label1.textAlignment = NSTextAlignmentCenter;
label1.backgroundColor = randomColor;
[rootView addSubview:label1];

UILabel *label2 = [UILabel new];
label2.lv_width = 100;
label2.lv_margin = 10;
label2.lv_height = 100;
label2.lv_gravity = LayoutGravityCenterHorizontal;
label2.text = @"label2";
label2.textAlignment = NSTextAlignmentCenter;
label2.backgroundColor = randomColor;
[rootView addSubview:label2];

UILabel *label3 = [UILabel new];
label3.lv_width = 100;
label3.lv_margin = 10;
label3.lv_height = 100;
label3.lv_alignParent = LayoutAlignParentRight;
label3.lv_gravity = LayoutGravityCenterVertical;
label3.text = @"label3";
label3.textAlignment = NSTextAlignmentCenter;
label3.backgroundColor = randomColor;
[rootView addSubview:label3];

UILabel *label4 = [UILabel new];
label4.lv_width = 100;
label4.lv_margin = 10;
label4.lv_height = 100;
label4.lv_alignParent = LayoutAlignParentBottom;
label4.lv_gravity = LayoutGravityCenterHorizontal;
label4.text = @"label4";
label4.textAlignment = NSTextAlignmentCenter;
label4.backgroundColor = randomColor;
[rootView addSubview:label4];

[rootView layout];
```
<img src="https://ws4.sinaimg.cn/large/006tKfTcgy1g0ak1wl34dj30n01dswhb.jpg" width="30%" height="50%"/>

```swift
RelativeLayoutView *rootView = [[RelativeLayoutView alloc]initWithWidth:layoutSizeFill height:layoutSizeFill];
rootView.backgroundColor = randomColor;
rootView.lv_margin = 10;
[self.view addSubview:rootView];

UILabel *label = [UILabel new];
label.lv_width = 100;
label.lv_margin = 10;
label.lv_height = 100;
label.lv_gravity = LayoutGravityCenter;
label.text = @"label";
label.textAlignment = NSTextAlignmentCenter;
label.backgroundColor = randomColor;
[rootView addSubview:label];

UILabel *label1 = [UILabel new];
label1.lv_width = 100;
label1.lv_margin = 10;
label1.lv_height = 100;
label1.lv_toTopOf = label;
label1.text = @"label1";
label1.textAlignment = NSTextAlignmentCenter;
label1.backgroundColor = randomColor;
[rootView addSubview:label1];

UILabel *label2 = [UILabel new];
label2.lv_width = 100;
label2.lv_margin = 10;
label2.lv_height = 100;
label2.lv_toLeftOf = label;
label2.text = @"label2";
label2.textAlignment = NSTextAlignmentCenter;
label2.backgroundColor = randomColor;
[rootView addSubview:label2];

UILabel *label3 = [UILabel new];
label3.lv_width = 100;
label3.lv_margin = 10;
label3.lv_height = 100;
label3.lv_toBottomOf = label;
label3.text = @"label3";
label3.textAlignment = NSTextAlignmentCenter;
label3.backgroundColor = randomColor;
[rootView addSubview:label3];

UILabel *label4 = [UILabel new];
label4.lv_width = 100;
label4.lv_margin = 10;
label4.lv_height = 100;
label4.lv_toRightOf = label;
label4.text = @"label4";
label4.textAlignment = NSTextAlignmentCenter;
label4.backgroundColor = randomColor;
[rootView addSubview:label4];

[rootView layout];
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0ak5uvz7wj30n01dsjud.jpg" width="30%" height="50%"/>

```swift
RelativeLayoutView *rootView = [[RelativeLayoutView alloc]initWithWidth:layoutSizeFill height:layoutSizeFill];
rootView.backgroundColor = randomColor;
rootView.lv_margin = 10;
[self.view addSubview:rootView];

UILabel *label = [UILabel new];
label.lv_width = 200;
label.lv_margin = 10;
label.lv_height = 200;
label.lv_gravity = LayoutGravityCenter;
label.text = @"label";
label.textAlignment = NSTextAlignmentCenter;
label.backgroundColor = randomColor;
[rootView addSubview:label];

UILabel *label1 = [UILabel new];
label1.lv_width = 50;
label1.lv_margin = 10;
label1.lv_height = 50;
label1.lv_alignTop = label;
label1.text = @"label1";
label1.textAlignment = NSTextAlignmentCenter;
label1.backgroundColor = randomColor;
[rootView addSubview:label1];

UILabel *label2 = [UILabel new];
label2.lv_width = 50;
label2.lv_margin = 10;
label2.lv_height = 50;
label2.lv_alignLeft = label;
label2.text = @"label2";
label2.textAlignment = NSTextAlignmentCenter;
label2.backgroundColor = randomColor;
[rootView addSubview:label2];

UILabel *label3 = [UILabel new];
label3.lv_width = 50;
label3.lv_margin = 10;
label3.lv_height = 50;
label3.lv_alignBottom = label;
label3.text = @"label3";
label3.textAlignment = NSTextAlignmentCenter;
label3.backgroundColor = randomColor;
[rootView addSubview:label3];

UILabel *label4 = [UILabel new];
label4.lv_width = 50;
label4.lv_margin = 10;
label4.lv_height = 50;
label4.lv_alignRight = label;
label4.text = @"label4";
label4.textAlignment = NSTextAlignmentCenter;
label4.backgroundColor = randomColor;
[rootView addSubview:label4];

[rootView layout];
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akefmawdj30n01dsdiu.jpg" width="30%" height="50%"/>

```swift
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
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akhjueg7j30n01dswh8.jpg" width="30%" height="50%"/>

```swift
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
```
<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1g0akl1r3s6j30n01dsn0o.jpg" width="30%" height="50%"/>