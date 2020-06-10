//
//  ObBoardingVCViewController.m
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import "ObBoardingVCViewController.h"

@interface ObBoardingVCViewController ()

@end

@implementation ObBoardingVCViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
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


-(IBAction)back:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


@end
