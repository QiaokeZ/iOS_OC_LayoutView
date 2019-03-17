//
//  RelativeLayoutView.h
//  RelativeLayoutView <https://github.com/QiaokeZ/iOS_OC_LayoutView>
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>
#import "UIView+Layout.h"

NS_ASSUME_NONNULL_BEGIN

@interface RelativeLayoutView : UIView

- (instancetype)initWithWidth:(CGFloat)width height:(CGFloat)height;

- (void)layout;

@end

NS_ASSUME_NONNULL_END
