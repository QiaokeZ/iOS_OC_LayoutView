//
//  LinearLayoutView.m
//  LinearLayoutView <https://github.com/QiaokeZ/iOS_OC_LayoutView>
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "LinearLayoutView.h"
#import "RelativeLayoutView.h"

@implementation LinearLayoutView

- (instancetype)initWithDirection:(LinearLayoutDirection)direction width:(CGFloat)width height:(CGFloat)height{
    return [self initWithDirection:direction contentGravity:LinearLayoutContentGravityNone width:width height:height];
}

- (instancetype)initWithDirection:(LinearLayoutDirection)direction
                   contentGravity:(LinearLayoutContentGravity)contentGravity
                            width:(CGFloat)width
                           height:(CGFloat)height{
    if (self = [super init]){
        _direction = direction;
        _contentGravity = contentGravity;
        self.lv_width = width;
        self.lv_height = height;
    }
    return self;
}

- (void)layout{
    [self setChildViewSize];
    [self setLayoutViewFrame];
    [self setChildViewOrigin];
}

- (void)setChildViewSize{
    CGSize parentSize = CGSizeMake([self getViewWidth:self], [self getViewHeight:self]);
    CGFloat totalWeight = 0;
    CGSize surplusSize = CGSizeZero;
    for (UIView *view in self.subviews){
        view.frame = CGRectZero;
        totalWeight += view.lv_weight;
        if (view.lv_weight > 0){
            surplusSize = CGSizeMake(surplusSize.width + (view.lv_margin * 2 + view.lv_marginLeft + view.lv_marginRight),
                                     surplusSize.height + (view.lv_margin * 2 + view.lv_marginTop + view.lv_marginBottom));
        }else{
            surplusSize = CGSizeMake(surplusSize.width + [self getViewWidth:view] + (view.lv_margin * 2 + view.lv_marginLeft + view.lv_marginRight),
                                     surplusSize.height + [self getViewHeight:view] + (view.lv_margin * 2 + view.lv_marginTop + view.lv_marginBottom));
        }
    }
    for (UIView *view in self.subviews){
        view.frame = CGRectMake(0, 0, ceil([self getViewWidth:view]), ceil([self getViewHeight:view]));
        if (view.lv_weight > 0){
            if (self.direction == LinearLayoutDirectionHorizontal){
                view.frame = CGRectMake(0, 0, ceil(MAX(view.lv_weight * (parentSize.width - surplusSize.width) / totalWeight, 0)), view.frame.size.height);
            }else{
                view.frame = CGRectMake(0, 0, view.frame.size.width, ceil(MAX(view.lv_weight * (parentSize.height - surplusSize.height) / totalWeight, 0)));
            }
        }
        if ([view isKindOfClass:[LinearLayoutView class]]) {
            [(LinearLayoutView *)view layout];
        } else if ([view isKindOfClass:[RelativeLayoutView class]]) {
            [(RelativeLayoutView *)view layout];
        }
    }
}

- (void)setLayoutViewFrame{
    if(CGRectEqualToRect(self.frame, CGRectZero)) {
        self.frame = CGRectMake(self.lv_margin + self.lv_marginLeft, self.lv_margin + self.lv_marginTop,
                                ceil([self getViewWidth:self]),ceil([self getViewHeight:self]));
    }
}

- (void)setChildViewOrigin{
    UIView *lastView = nil;
    for (UIView *view in self.subviews){
        CGPoint origin = CGPointZero;
        CGSize size = CGSizeZero;
        if (lastView != nil){
            size = CGSizeMake(CGRectGetMaxX(lastView.frame) + lastView.lv_margin + lastView.lv_marginRight,
                              CGRectGetMaxY(lastView.frame) + lastView.lv_margin + lastView.lv_marginBottom);
        }
        if (self.direction == LinearLayoutDirectionHorizontal){
            origin.x = view.lv_margin + view.lv_marginLeft + size.width;
            switch (self.contentGravity) {
                case LinearLayoutContentGravityCenter:
                case LinearLayoutContentGravityCenterVertical:
                    origin.y = ((self.frame.size.height - view.frame.size.height) / 2) + (view.lv_marginTop - view.lv_marginBottom);
                    break;
                case LinearLayoutContentGravityBottom:
                    origin.y = self.frame.size.height - view.frame.size.height - view.lv_margin - view.lv_marginBottom;
                    break;
                default:
                    origin.y = view.lv_margin + view.lv_marginTop;
                    break;
            }
            switch (view.lv_gravity) {
                case LayoutGravityCenter:
                case LayoutGravityCenterVertical:
                    origin.y = ((self.frame.size.height - view.frame.size.height) / 2) + (view.lv_marginTop - view.lv_marginBottom);
                    break;
                case LayoutGravityCenterHorizontal:
                    origin.y = view.lv_margin + view.lv_marginTop;
                    break;
                case LayoutGravityBottom:
                    origin.y = self.frame.size.height - view.frame.size.height - view.lv_margin - view.lv_marginBottom;
                    break;
                case LayoutGravityTop:
                    origin.y = view.lv_margin + view.lv_marginTop;
                    break;
                default: break;
            }
        }else{
            origin.y = view.lv_margin + view.lv_marginTop + size.height;
            switch (self.contentGravity) {
                case LinearLayoutContentGravityCenter:
                case LinearLayoutContentGravityCenterHorizontal:
                    origin.x = ((self.frame.size.width - view.frame.size.width) / 2) + (view.lv_marginLeft - view.lv_marginRight);
                    break;
                case LinearLayoutContentGravityBottom:
                    origin.x = self.frame.size.width - view.frame.size.width - view.lv_margin - view.lv_marginRight;
                    break;
                default:
                    origin.x = view.lv_margin + view.lv_marginLeft;
                    break;
            }
            switch (view.lv_gravity) {
                case LayoutGravityCenter:
                case LayoutGravityCenterHorizontal:
                    origin.x = ((self.frame.size.width - view.frame.size.width) / 2) + (view.lv_marginLeft - view.lv_marginRight);
                    break;
                case LayoutGravityCenterVertical:
                    origin.x = view.lv_margin + view.lv_marginLeft;
                    break;
                case LayoutGravityRight:
                    origin.x = self.frame.size.width - view.frame.size.width - view.lv_margin - view.lv_marginRight;
                    break;
                case LayoutGravityLeft:
                    origin.x = view.lv_margin + view.lv_marginLeft;
                    break;
                default: break;
            }
        }
        view.frame = CGRectMake(origin.x, origin.y, view.frame.size.width, view.frame.size.height);
        lastView = view;
    }
    CGSize childTotalSize = [self getViewChildTotalSize:self];
    for (UIView *view in self.subviews){
        CGPoint origin = view.frame.origin;
        if (self.direction == LinearLayoutDirectionHorizontal){
            if (self.contentGravity == LinearLayoutContentGravityCenter){
                origin.x = view.frame.origin.x + (self.frame.size.width - childTotalSize.width) / 2;
            }
        }else{
            if (self.contentGravity == LinearLayoutContentGravityCenter){
                origin.y = view.frame.origin.y + (self.frame.size.height - childTotalSize.height) / 2;
            }
        }
        view.frame = CGRectMake(origin.x, origin.y, view.frame.size.width, view.frame.size.height);
    }
}

- (CGFloat)getViewWidth:(UIView *)from{
    if (from.frame.size.width > 0){
        return from.frame.size.width;
    }else{
        CGFloat width = 0.0;
        if (from.lv_width == layoutSizeFill){
            width = from.superview.frame.size.width - from.lv_margin * 2 - from.lv_marginLeft - from.lv_marginRight;
            if ([from.superview isKindOfClass:[LinearLayoutView class]] || [from.superview isKindOfClass:[RelativeLayoutView class]]) {
                width = [self getViewWidth:from.superview] - from.lv_margin * 2 - from.lv_marginLeft - from.lv_marginRight;
            }
        }else if (from.lv_width == layoutSizeWrap){
            if ([from isKindOfClass:[LinearLayoutView class]]) {
                width = [self getLayoutWrapViewSize:(LinearLayoutView *)from].width;
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
        CGFloat height = 0.0;
        if (from.lv_height == layoutSizeFill){
            height = from.superview.frame.size.height - from.lv_margin * 2 - from.lv_marginTop - from.lv_marginBottom;
            if ([from.superview isKindOfClass:[LinearLayoutView class]] || [from.superview isKindOfClass:[RelativeLayoutView class]]) {
                height = [self getViewHeight:from.superview] - from.lv_margin * 2 - from.lv_marginTop - from.lv_marginBottom;
            }
        }else if (from.lv_height == layoutSizeWrap){
            if ([from isKindOfClass:[LinearLayoutView class]]) {
                height = [self getLayoutWrapViewSize:(LinearLayoutView *)from].height;
            }
        }else{
            height = from.lv_height;
        }
        return  height;
    }
}

- (CGSize)getLayoutWrapViewSize:(LinearLayoutView *)from{
    CGSize size = CGSizeZero;
    for (UIView *view in from.subviews){
        if (from.direction == LinearLayoutDirectionHorizontal){
            size.width += [self getViewWidth:from] + view.lv_margin * 2 + view.lv_marginLeft + view.lv_marginRight;
            CGFloat height = [self getViewHeight:from] + view.lv_margin * 2 + view.lv_marginTop + view.lv_marginBottom;
            if (height > size.height){
                size.height = height;
            }
        }else{
            size.height += [self getViewHeight:from] + view.lv_margin * 2 + view.lv_marginTop + view.lv_marginBottom;
            CGFloat width = [self getViewWidth:from] + view.lv_margin * 2 +  view.lv_marginLeft + view.lv_marginRight;
            if (width > size.width){
                size.width = width;
            }
        }
    }
    return size;
}

- (CGSize)getViewChildTotalSize:(LinearLayoutView *)from{
    CGSize size = CGSizeZero;
    for (UIView *view in from.subviews){
        if (from.direction == LinearLayoutDirectionHorizontal){
            size.width += view.frame.size.width + view.lv_margin * 2 + view.lv_marginLeft + view.lv_marginRight;
            size.height = CGRectGetMaxY(view.frame) + view.lv_margin + view.lv_marginBottom;
        }else{
            size.height += view.frame.size.height + view.lv_margin * 2 + view.lv_marginTop + view.lv_marginBottom;
            size.width = CGRectGetMaxX(view.frame) + view.lv_margin + view.lv_marginRight;
        }
    }
    return size;
}

@end
