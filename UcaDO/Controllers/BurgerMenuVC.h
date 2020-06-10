//
//  BurgerMenuVC.h
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol NavDrawerDelegate <NSObject>
@required
- (void)NavDrawerSelection:(NSInteger)selectionIndex;
@end

@interface BurgerMenuVC : UINavigationController <UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSArray *menuArray;
}

@property (nonatomic, strong) UIPanGestureRecognizer *pan_gr;
@property (weak, nonatomic)id<NavDrawerDelegate> NavDrawerDelegate;

- (void)drawerToggle;


@end
