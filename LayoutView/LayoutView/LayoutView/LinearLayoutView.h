//
//  LinearLayoutView.h
//  LinearLayoutView <https://github.com/QiaokeZ/iOS_OC_LayoutView>
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>
#import "UIView+Layout.h"

typedef NS_ENUM(NSInteger, LinearLayoutDirection) {
    LinearLayoutDirectionVertical,
    LinearLayoutDirectionHorizontal
};

typedef NS_ENUM(NSInteger, LinearLayoutContentGravity) {
    LinearLayoutContentGravityNone,
    LinearLayoutContentGravityTop,
    LinearLayoutContentGravityLeft,
    LinearLayoutContentGravityBottom,
    LinearLayoutContentGravityRight,
    LinearLayoutContentGravityCenter,
    LinearLayoutContentGravityCenterHorizontal,
    LinearLayoutContentGravityCenterVertical
};

NS_ASSUME_NONNULL_BEGIN

@interface LinearLayoutView : UIView

- (instancetype)initWithDirection:(LinearLayoutDirection)direction
                            width:(CGFloat)width
                           height:(CGFloat)height;

- (instancetype)initWithDirection:(LinearLayoutDirection)direction
                   contentGravity:(LinearLayoutContentGravity)contentGravity
                            width:(CGFloat)width
                           height:(CGFloat)height;

@property (nonatomic, readonly, assign) LinearLayoutDirection direction;
@property (nonatomic, readonly, assign) LinearLayoutContentGravity contentGravity;

- (void)layout;

@end

NS_ASSUME_NONNULL_END
