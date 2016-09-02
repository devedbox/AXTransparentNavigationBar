//
//  UINavigationBar+Transparent.h
//  AXTransparentNavigationBar
//
//  Created by devedbox on 16/9/2.
//  Copyright © 2016年 jiangyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Transparent)
/// Set transparent of navigation bar.
///
/// @discusstion This method works only if the translucent is setted to YES. If not, the method will set translucent to YES automatically.
///
@property(assign, nonatomic, getter=isTransparent) BOOL transparent;
// Animation method.
- (void)setTransparent:(BOOL)transparent animated:(BOOL)animated;
@end