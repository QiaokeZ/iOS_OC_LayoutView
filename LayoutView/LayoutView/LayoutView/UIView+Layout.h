//
//  UIView+layout.h
//  UIView+layout <https://github.com/QiaokeZ/iOS_OC_LayoutView>
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN CGFloat const layoutSizeFill;
UIKIT_EXTERN CGFloat const layoutSizeWrap;

typedef NS_ENUM(NSInteger, LayoutGravity) {
    LayoutGravityNone,
    LayoutGravityTop,
    LayoutGravityLeft,
    LayoutGravityBottom,
    LayoutGravityRight,
    LayoutGravityCenter,
    LayoutGravityCenterHorizontal,
    LayoutGravityCenterVertical
};

typedef NS_OPTIONS(NSUInteger, LayoutAlignParent) {
    LayoutAlignParentNone = 0,
    LayoutAlignParentTop = 1 << 0,
    LayoutAlignParentLeft = 1 << 1,
    LayoutAlignParentBottom = 1 << 2,
    LayoutAlignParentRight = 1 << 3
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Layout)
@property (nonatomic, assign) LayoutGravity lv_gravity;
@property (nonatomic, assign) LayoutAlignParent lv_alignParent;
@property (nonatomic, assign) CGFloat lv_margin;
@property (nonatomic, assign) CGFloat lv_marginTop;
@property (nonatomic, assign) CGFloat lv_marginLeft;
@property (nonatomic, assign) CGFloat lv_marginBottom;
@property (nonatomic, assign) CGFloat lv_marginRight;
@property (nonatomic, assign) CGFloat lv_width;
@property (nonatomic, assign) CGFloat lv_height;
@property (nonatomic, assign) CGFloat lv_weight;
@property (nonatomic, strong) UIView *lv_alignTop;
@property (nonatomic, strong) UIView *lv_alignLeft;
@property (nonatomic, strong) UIView *lv_alignBottom;
@property (nonatomic, strong) UIView *lv_alignRight;
@property (nonatomic, strong) UIView *lv_toTopOf;
@property (nonatomic, strong) UIView *lv_toLeftOf;
@property (nonatomic, strong) UIView *lv_toBottomOf;
@property (nonatomic, strong) UIView *lv_toRightOf;
@end

NS_ASSUME_NONNULL_END
