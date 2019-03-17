//
//  UIView+layout.m
//  UIView+layout <https://github.com/QiaokeZ/iOS_LayoutView>
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "UIView+Layout.h"
#import <objc/message.h>
#import <objc/runtime.h>

CGFloat const layoutSizeFill = 19921014;
CGFloat const layoutSizeWrap = 19930513;

@implementation UIView (Layout)

- (void)setLv_gravity:(LayoutGravity)lv_gravity{
    NSValue *value = [NSValue value:&lv_gravity withObjCType:@encode(NSInteger)];
    objc_setAssociatedObject(self, @selector(lv_gravity), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LayoutGravity)lv_gravity{
    NSInteger gravity = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_gravity));
    [value getValue:&gravity];
    return gravity;
}

- (void)setLv_alignParent:(LayoutAlignParent)lv_alignParent{
    NSValue *value = [NSValue value:&lv_alignParent withObjCType:@encode(NSUInteger)];
    objc_setAssociatedObject(self, @selector(lv_alignParent), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LayoutAlignParent)lv_alignParent{
    NSUInteger alignParent = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_alignParent));
    [value getValue:&alignParent];
    return alignParent;
}

- (void)setLv_margin:(CGFloat)lv_margin{
    NSValue *value = [NSValue value:&lv_margin withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_margin), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_margin{
    CGFloat margin = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_margin));
    [value getValue:&margin];
    return margin;
}

- (void)setLv_marginTop:(CGFloat)lv_marginTop{
    NSValue *value = [NSValue value:&lv_marginTop withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_marginTop), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_marginTop{
    CGFloat marginTop = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_marginTop));
    [value getValue:&marginTop];
    return marginTop;
}

- (void)setLv_marginLeft:(CGFloat)lv_marginLeft{
    NSValue *value = [NSValue value:&lv_marginLeft withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_marginLeft), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_marginLeft{
    CGFloat marginLeft = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_marginLeft));
    [value getValue:&marginLeft];
    return marginLeft;
}

- (void)setLv_marginBottom:(CGFloat)lv_marginBottom{
    NSValue *value = [NSValue value:&lv_marginBottom withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_marginBottom), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_marginBottom{
    CGFloat marginBottom = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_marginBottom));
    [value getValue:&marginBottom];
    return marginBottom;
}

- (void)setLv_marginRight:(CGFloat)lv_marginRight{
    NSValue *value = [NSValue value:&lv_marginRight withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_marginRight), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_marginRight{
    CGFloat marginRight = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_marginRight));
    [value getValue:&marginRight];
    return marginRight;
}

- (void)setLv_width:(CGFloat)lv_width{
    NSValue *value = [NSValue value:&lv_width withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_width), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_width{
    CGFloat width = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_width));
    [value getValue:&width];
    return width;
}

- (void)setLv_height:(CGFloat)lv_height{
    NSValue *value = [NSValue value:&lv_height withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_height), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_height{
    CGFloat height = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_height));
    [value getValue:&height];
    return height;
}

- (void)setLv_weight:(CGFloat)lv_weight{
    NSValue *value = [NSValue value:&lv_weight withObjCType:@encode(CGFloat)];
    objc_setAssociatedObject(self, @selector(lv_weight), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)lv_weight{
    CGFloat weight = 0;
    NSValue *value = objc_getAssociatedObject(self, @selector(lv_weight));
    [value getValue:&weight];
    return weight;
}

- (void)setLv_alignTop:(UIView *)lv_alignTop{
    objc_setAssociatedObject(self, @selector(lv_alignTop), lv_alignTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_alignTop{
    return objc_getAssociatedObject(self, @selector(lv_alignTop));
}

- (void)setLv_alignLeft:(UIView *)lv_alignLeft{
    objc_setAssociatedObject(self, @selector(lv_alignLeft), lv_alignLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_alignLeft{
    return objc_getAssociatedObject(self, @selector(lv_alignLeft));
}

- (void)setLv_alignBottom:(UIView *)lv_alignBottom{
    objc_setAssociatedObject(self, @selector(lv_alignBottom), lv_alignBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_alignBottom{
     return objc_getAssociatedObject(self, @selector(lv_alignBottom));
}

- (void)setLv_alignRight:(UIView *)lv_alignRight{
    objc_setAssociatedObject(self, @selector(lv_alignRight), lv_alignRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_alignRight{
    return objc_getAssociatedObject(self, @selector(lv_alignRight));
}

- (void)setLv_toTopOf:(UIView *)lv_toTopOf{
    objc_setAssociatedObject(self, @selector(lv_toTopOf), lv_toTopOf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_toTopOf{
    return objc_getAssociatedObject(self, @selector(lv_toTopOf));
}

- (void)setLv_toLeftOf:(UIView *)lv_toLeftOf{
    objc_setAssociatedObject(self, @selector(lv_toLeftOf), lv_toLeftOf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_toLeftOf{
    return objc_getAssociatedObject(self, @selector(lv_toLeftOf));
}

- (void)setLv_toBottomOf:(UIView *)lv_toBottomOf{
    objc_setAssociatedObject(self, @selector(lv_toBottomOf), lv_toBottomOf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_toBottomOf{
    return objc_getAssociatedObject(self, @selector(lv_toBottomOf));
}

- (void)setLv_toRightOf:(UIView *)lv_toRightOf{
    objc_setAssociatedObject(self, @selector(lv_toRightOf), lv_toRightOf, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lv_toRightOf{
    return objc_getAssociatedObject(self, @selector(lv_toRightOf));
}

@end
