//
//  UINavigationBar+Transparent.h
//  AXTransparentNavigationBar
//
//  Created by devedbox on 16/9/2.
//  Copyright © 2016年 devedbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Transparent)
/// Set transparent of navigation bar.
///
@property(assign, nonatomic, getter=isTransparent) BOOL transparent;
// Animation method.
- (void)setTransparent:(BOOL)transparent animated:(BOOL)animated;
@end

@interface UIViewController (NavigationBarTransparent)
/// Is navigation bar transparent.
@property(assign, nonatomic, getter=isNavigationBarTransparent) BOOL navigationBarTransparent;
/// Set navigation tarnsparent animated.
- (void)setNavigationBarTransparent:(BOOL)navigationBarTransparent animated:(BOOL)animated;
@end
