//
//  RelativeLayoutView.m
//  RelativeLayoutView <https://github.com/QiaokeZ/iOS_OC_LayoutView>
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RelativeLayoutView.h"
#import "LinearLayoutView.h"

@implementation RelativeLayoutView

- (instancetype)initWithWidth:(CGFloat)width height:(CGFloat)height{
    if (self = [super init]){
        self.lv_width = width;
        self.lv_height = height;
    }
    return self;
}

- (void)layout{
    [self setChildViewSize];
    [self setChildViewOrigin];
    [self setLayoutViewFrame];
}

- (void)setChildViewSize{
    for (UIView *view in self.subviews){
        view.frame = CGRectZero;
        if ([view isKindOfClass:[LinearLayoutView class]]) {
            [(LinearLayoutView *)view layout];
        } else if ([view isKindOfClass:[RelativeLayoutView class]]) {
            [(RelativeLayoutView *)view layout];
        }else{
            view.frame = CGRectMake(0, 0, ceil([self getViewWidth:view]), ceil([self getViewHeight:view]));
        }
    }
}

- (void)setChildViewOrigin{
    CGSize parentSize = CGSizeMake([self getViewWidth:self], [self getViewHeight:self]);
    for (UIView *view in self.subviews){
        CGPoint origin = CGPointMake(view.lv_margin + view.lv_marginLeft, view.lv_margin + view.lv_marginTop);
        if (view.lv_toTopOf != nil){
            origin.y = view.lv_toTopOf.frame.origin.y - view.lv_toTopOf.lv_margin - view.lv_toTopOf.lv_marginTop - (view.frame.size.height + view.lv_margin + view.lv_marginBottom);
        }
        if (view.lv_toLeftOf != nil){
            origin.x = view.lv_toLeftOf.frame.origin.x - view.lv_toLeftOf.lv_margin - view.lv_toLeftOf.lv_marginLeft - (view.frame.size.width + view.lv_margin + view.lv_marginRight);
        }
        if (view.lv_toBottomOf != nil){
            origin.y = CGRectGetMaxY(view.lv_toBottomOf.frame) + view.lv_toBottomOf.lv_margin + view.lv_toBottomOf.lv_marginBottom + view.lv_margin + view.lv_marginTop;
        }
        if (view.lv_toRightOf != nil){
            origin.x = CGRectGetMaxX(view.lv_toRightOf.frame) + view.lv_toRightOf.lv_margin + view.lv_toRightOf.lv_marginRight + view.lv_margin + view.lv_marginLeft;
        }
        if (view.lv_alignTop != nil){
            origin.y = view.lv_alignTop.frame.origin.y + view.lv_margin + view.lv_marginTop;
        }
        if (view.lv_alignLeft != nil){
            origin.x = view.lv_alignLeft.frame.origin.x + view.lv_margin + view.lv_marginLeft;
        }
        if (view.lv_alignBottom != nil){
            origin.y = CGRectGetMaxY(view.lv_alignBottom.frame)  - (view.frame.size.height + view.lv_margin + view.lv_marginBottom);
        }
        if (view.lv_alignRight != nil){
            origin.x = CGRectGetMaxX(view.lv_alignRight.frame) - (view.frame.size.width + view.lv_margin + view.lv_marginLeft);
        }
        if (view.lv_alignParent | LayoutAlignParentTop){
            origin.y = view.lv_margin + view.lv_marginTop;
        }
        if (view.lv_alignParent | LayoutAlignParentLeft){
            origin.x = view.lv_margin + view.lv_marginLeft;
        }
        if (view.lv_alignParent | LayoutAlignParentBottom){
            origin.y = parentSize.height - (view.frame.size.height + view.lv_margin + view.lv_marginBottom);
        }
        if (view.lv_alignParent | LayoutAlignParentRight){
            origin.x = parentSize.width - (view.frame.size.width + view.lv_margin + view.lv_marginRight);
        }
        if (view.lv_gravity == LayoutGravityCenter){
            origin.x = ((parentSize.width - view.frame.size.width) / 2) + (view.lv_marginLeft - view.lv_marginRight);
            origin.y = ((parentSize.height - view.frame.size.height) / 2) + (view.lv_marginTop - view.lv_marginBottom);
        }
        if (view.lv_gravity == LayoutGravityCenterHorizontal){
            origin.x = ((parentSize.width - view.frame.size.width) / 2) + (view.lv_marginLeft - view.lv_marginRight);
        }
        if (view.lv_gravity == LayoutGravityCenterVertical){
            origin.y = ((parentSize.height - view.frame.size.height) / 2) + (view.lv_marginTop - view.lv_marginBottom);
        }
        view.frame = CGRectMake(origin.x, origin.y, view.frame.size.width, view.frame.size.height);
    }
}

- (void)setLayoutViewFrame{
    if(CGRectEqualToRect(self.frame, CGRectZero)) {
        self.frame = CGRectMake(self.lv_margin + self.lv_marginLeft, self.lv_margin + self.lv_marginTop,
                                ceil([self getViewWidth:self]),ceil([self getViewHeight:self]));
    }
}

- (CGFloat)getViewWidth:(UIView *)from{
    if (from.frame.size.width > 0){
        return from.frame.size.width;
    }else{
        CGFloat width = 0;
        if (from.lv_width == layoutSizeFill){
            width = from.superview.frame.size.width - from.lv_margin * 2 - from.lv_marginLeft - from.lv_marginRight;
            if ([from.superview isKindOfClass:[LinearLayoutView class]] || [from.superview isKindOfClass:[RelativeLayoutView class]]) {
                width = [self getViewWidth:from.superview] - from.lv_margin * 2 - from.lv_marginLeft - from.lv_marginRight;
            }
        }else if (from.lv_width == layoutSizeWrap){
            for (UIView *view in from.subviews){
                if (CGRectGetMaxX(view.frame) + view.lv_margin + view.lv_marginRight > width){
                    width = CGRectGetMaxX(view.frame) + view.lv_margin + view.lv_marginRight;
                }
            }
        }else{
            width = from.lv_width;
        }
        return  width;
    }
}

- (CGFloat)getViewHeight:(UIView *)from{
    if (from.frame.size.height > 0){
        return from.frame.size.height;
    }else{
        CGFloat height = 0;
        if (from.lv_height == layoutSizeFill){
            height = from.superview.frame.size.height - from.lv_margin * 2 - from.lv_marginTop - from.lv_marginBottom;
            if ([from.superview isKindOfClass:[LinearLayoutView class]] || [from.superview isKindOfClass:[RelativeLayoutView class]]) {
                height = [self getViewHeight:from.superview] - from.lv_margin * 2 - from.lv_marginTop - from.lv_marginBottom;
            }
        }else if (from.lv_height == layoutSizeWrap){
            for (UIView *view in from.subviews){
                if (CGRectGetMaxY(view.frame) + view.lv_margin + view.lv_marginBottom > height){
                    height = CGRectGetMaxY(view.frame) + view.lv_margin + view.lv_marginBottom;
                }
            }
        }else{
            height = from.lv_height;
        }
        return  height;
    }
}
@end
