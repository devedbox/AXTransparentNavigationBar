//
//  ViewController2.m
//  AXTransparentNavigationBar
//
//  Created by devedbox on 16/9/2.
//  Copyright © 2016年 jiangyou. All rights reserved.
//

#import "ViewController2.h"
#import "UINavigationBar+Transparent.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.extendedLayoutIncludesOpaqueBars = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setTransparent:NO animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)unTransparent:(id)sender {
    [self.navigationController.navigationBar setTransparent:NO animated:YES];
}
@end
