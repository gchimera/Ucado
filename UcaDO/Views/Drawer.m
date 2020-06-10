//
//  Drawer.m
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import "Drawer.h"

@implementation Drawer

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (IBAction)logoutButton:(UIButton *)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"isLoggedIn"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"isLoggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:nil];
    UIViewController *uv = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    //    [[self navigationController] pushViewController:uv animated:YES];
    //TODO FIX
}


@end
