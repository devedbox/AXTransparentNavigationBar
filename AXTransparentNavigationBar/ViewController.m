//
//  ViewController.m
//  AXTransparentNavigationBar
//
//  Created by devedbox on 16/9/2.
//  Copyright © 2016年 jiangyou. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Transparent.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationController.delegate = self;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:0 target:nil action:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setTransparent:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)transparent:(id)sender {
    [self.navigationController.navigationBar setTransparent:YES animated:NO];
}

@end