//
//  UINavigationBar+Transparent.m
//  AXTransparentNavigationBar
//
//  Created by devedbox on 16/9/2.
//  Copyright © 2016年 jiangyou. All rights reserved.
//

#import "UINavigationBar+Transparent.h"
#import <objc/runtime.h>
#import <pop/POP.h>

@interface UINavigationBar (Transparent_Private)
/// Translucent original value .
@property(assign, nonatomic) BOOL originalTranslucent;
/// Original background color.
@property(strong, nonatomic) UIColor *originalBackgroundColor;
/// Original extended layout includes opaque bars.
@property(assign, nonatomic) BOOL originalExtendedLayoutIncludesOpaqueBars;
@end

@implementation UINavigationBar (Transparent)
- (BOOL)isTransparent {
    return [self transparent];
}

- (BOOL)transparent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setTransparent:(BOOL)transparent {
    [self setTransparent:transparent animated:NO];
}

- (void)setTransparent:(BOOL)transparent animated:(BOOL)animated {
    objc_setAssociatedObject(self, @selector(transparent), @(transparent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (transparent) {
        if (!self.isTranslucent) {
            self.originalTranslucent = self.isTranslucent;
            self.translucent = YES;
        }
    } else {
        if (!self.originalTranslucent) {
            self.translucent = self.originalTranslucent;
        }
    }
    if (transparent) {
        self.originalBackgroundColor = self.backgroundColor;
        self.backgroundColor = [UIColor clearColor];
    } else {
        self.backgroundColor = self.originalBackgroundColor;
    }
    
    // Get subviews.
    NSArray<UIView *> *subviews = [self subviews];
    for (UIView *view in subviews) {
        if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) continue;
        if (([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")] || [view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) || [[NSPredicate predicateWithFormat:@"SELF BEGINSWITH[cd] '_'"] evaluateWithObject:NSStringFromClass(view.class)]) {
            if (animated) {
                [view pop_removeAllAnimations];
                POPBasicAnimation *ani = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
                ani.toValue = @(transparent?.0:1.0);
                ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
                ani.duration = 0.25;
                [view pop_addAnimation:ani forKey:@"alpha"];
            } else {
                view.alpha = transparent?.0:1.0;
            }
        }
    }
    
    UIResponder *responsder=self;
    while (responsder) {
        if ([responsder isKindOfClass:UINavigationController.class]) {
            UINavigationController *navigationController = (UINavigationController *)responsder;
            for (UIViewController *viewController in navigationController.viewControllers) {
                viewController.extendedLayoutIncludesOpaqueBars = YES;
            }
        }
        responsder = [responsder nextResponder];
    }
}
@end

@implementation UINavigationBar (Transparent_Private)
- (BOOL)originalTranslucent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setOriginalTranslucent:(BOOL)originalTranslucent {
    objc_setAssociatedObject(self, @selector(originalTranslucent), @(originalTranslucent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)originalBackgroundColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setOriginalBackgroundColor:(UIColor *)originalBackgroundColor {
    objc_setAssociatedObject(self, @selector(originalBackgroundColor), originalBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)originalExtendedLayoutIncludesOpaqueBars {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setOriginalExtendedLayoutIncludesOpaqueBars:(BOOL)originalExtendedLayoutIncludesOpaqueBars {
    objc_setAssociatedObject(self, @selector(originalExtendedLayoutIncludesOpaqueBars), @(originalExtendedLayoutIncludesOpaqueBars), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
