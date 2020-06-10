//
//  LoginParentVC.h
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQUIView+Hierarchy.h"
#import "Constant.h"

@interface LoginParentVC : UIViewController
{
}

/*!
 *@description Show the custom spinner in the passed as parameter view
 *@param view Just the view where to show the spinner
 */
- (void) showSpinningInView:(UIView *)view;

/*!
 *@description Just dismiss ViewController
 */
- (IBAction)goBack:(id)sender;

@end

