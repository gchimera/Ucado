//
//  LoginViewController.m
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import "LoginViewController.h"

#import "LoginViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <AFNetworking/AFNetworking.h>
//#import "User.h"
//#import "ProfileViewController.h"
//#import "Settings.h"

@interface LoginViewController ()
{
    AVPlayer *myPlayer;
    AVPlayerItem *item;
    AVPlayerLayer *myVideoLayer;
    
    __weak IBOutlet UIImageView *imgLogo;
    __weak IBOutlet NSLayoutConstraint *logoConstraintWidth;
    __weak IBOutlet UIProgressView *progressBar;
    
    NSDictionary *facebookDicResult;
    
//    User *userObj;
    
    
}

- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnEmail:(id)sender;
- (IBAction)btnGuest:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profileDetails = [[NSMutableDictionary alloc] init];
    //Setup the background with a Image
    UIImageView *imgViewBg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [imgViewBg setImage:[UIImage imageNamed:@"loginBg"]];
    [self.view insertSubview:imgViewBg atIndex:0];
    
    
    
    //Check for orientation
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"isLoggedIn"]) {
        //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"cnine" bundle:nil];
        UIViewController *uv = [self.storyboard instantiateViewControllerWithIdentifier:@"BuyerOrSellerViewController"];
        [self presentViewController:uv animated:YES completion:^(){
            
            NSLog(@"present view controller success");
        }];
        
        
    }
    
    //Hide the progressbar until the video starts
    progressBar.alpha = 0;
    
    
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [imgLogo setImage:[UIImage imageNamed:@"ucadoLogo"]];
    
    //Change the image for the video after a time
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //        [self showVideo];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}


#pragma mark NAVIGATION


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"gotoCreateProfile"])
    {
        //Parameters from facebook to populate data
        
//        ProfileViewController *pvc = [segue destinationViewController];
//        pvc.profileDetails = self.profileDetails;
    }
    
}

#pragma mark ACTION BUTTONS


- (IBAction)btnFacebook:(id)sender
{
    [self showSpinningInView:self.view];
    
//    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    
//    [login
//     logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends", @"user_hometown", @"user_birthday", @"read_custom_friendlists"]
//     fromViewController:self
//     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
//         if (error)
//         {
//             NSLog(@"Error:%@",error);
//             NSLog(@"Process error");
//             [spinner.view removeFromSuperview];
//             
//         }
//         else if (result.isCancelled)
//         {
//             NSLog(@"Cancelled");
//             [spinner.view removeFromSuperview];
//             
//         } else {
//             [spinner.view removeFromSuperview];
//             
//             //             facebookDicResult = [[NSDictionary alloc] initWithObjectsAndKeys:
//             //                               result.token.tokenString, @"facebookToken",
//             //                               result.token.userID,@"facebookId",
//             //                               //result.token.appID,@"facebookAppId",
//             //                               nil];
//             
//             
//             //             NSLog(@"Logged in: %@", facebookDicResult);
//             [self.profileDetails setValue:result.token.tokenString forKey:@"facebook_token"];
//             [self fetchUserInfo];
//             
//             //Should go to create profile from here
//             //             ProfileViewController *uv = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
//             //             [uv setProfileDetails:self.profileDetails];
//             //             [[self navigationController] pushViewController:uv animated:YES];
//             
//         }
//     }];
    
}

-(void)fetchUserInfo
{
//    if ([FBSDKAccessToken currentAccessToken])
//    {
//        NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
//        [parameters setValue:@"id, name, email, birthday, gender, picture" forKey:@"fields"];
//        
//        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters tokenString:[FBSDKAccessToken currentAccessToken].tokenString version:@"v2.3" HTTPMethod:nil]
//         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//             if (!error)
//             {
//                 
//                 
//                 
//                 [self.profileDetails setValue:result[@"email"] forKey:@"email"];
//                 [self.profileDetails setValue:result[@"name"] forKey:@"name"];
//                 [self.profileDetails setValue:result[@"id"] forKey:@"facebook_id"];
//                 [self.profileDetails setValue:result[@"birthday"] forKey:@"birthday"];
//                 [self.profileDetails setValue:result[@"gender"] forKey:@"gender"];
//                 [self.profileDetails setValue:[[result[@"picture"] objectForKey:@"data"] valueForKey:@"url"] forKey:@"picture_url"];
//                 
//                 [self performSegueWithIdentifier:@"gotoCreateProfile" sender:self.profileDetails];
//                 NSLog(@"result : %@",result);
//             }
//             else
//             {
//                 NSLog(@"ErrorFB:%@",error);
//             }
//         }];
//        
//    }
}


- (IBAction)btnEmail:(id)sender
{
    [self performSegueWithIdentifier:@"gotoRegister" sender:self];
    
}

- (IBAction)btnGuest:(id)sender
{
    UIViewController *uv = [self.storyboard instantiateViewControllerWithIdentifier:@"BuyerOrSellerViewController"];
    [[self navigationController] pushViewController:uv animated:YES];
    
    //[self showSpinningInView:self.view];
}

#pragma mark EXTERNAL METHODS

- (void) showSpinningInView:(UIView *)view
{
//    if (spinner == nil)
//    {
//        spinner = [[MyActivityOverlayController alloc] initWithFrame:self.view.bounds];
//    }
//    
//    [view insertSubview:spinner.view aboveSubview:view];
}


#pragma mark PRIVATE METHODS

- (void) showVideo
{
    //Change the contstrain to get all the width
    [UIView animateWithDuration:1 animations:^{
        
        imgLogo.alpha = 0.0f;
    }completion:^(BOOL finished)
     {
         myVideoLayer = [AVPlayerLayer playerLayerWithPlayer:myPlayer];
         myVideoLayer.frame = CGRectMake(0, 0, imgLogo.frame.size.width, imgLogo.frame.size.height);
         myVideoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
         [imgLogo.layer addSublayer:myVideoLayer];
         
         [self playVideo:nil];
         
         [UIView animateWithDuration:2 animations:^{
             
             imgLogo.alpha = 1.0f;
             
             //Show the progressBar
             progressBar.alpha = 1;
         }];
     }];
}

- (IBAction)playVideo:(id)sender
{
    if ([myPlayer status] == AVPlayerStatusReadyToPlay)
    {
        [myPlayer play];
        __block LoginViewController *blockSelf = self;
        [myPlayer addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1.0 / 60.0, NSEC_PER_SEC)
                                               queue:NULL
                                          usingBlock:^(CMTime time){
                                              [blockSelf updateProgressBar];
                                          }];
    }
    else if([myPlayer status] == AVPlayerStatusFailed)
    {
        NSLog(@"Error Playing. %@",myPlayer.error);
    }
    else if ([myPlayer status] == AVPlayerItemStatusUnknown)
    {
        NSLog(@"Unknow player status");
        [myPlayer pause];
    }
}

- (void) updateProgressBar
{
    double duration = CMTimeGetSeconds(item.duration);
    double time = CMTimeGetSeconds(myPlayer.currentTime);
    progressBar.progress = (CGFloat) (time / duration);
    
    if (duration == time)
    {
        [myVideoLayer removeFromSuperlayer];
        
        //Translate the image to its original possition
        if ([self imageOrientationAngle] < 1)
        {
            [self rotateToRoriginalPosition];
        }
        
        //Avoid to rotate the image once the video did finish
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
        
        //Restore the image
        [imgLogo setImage:[UIImage imageNamed:@"ucadoLogo"]];
    }
    
}
#pragma mark ORIENTATION STUFF

- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    
    
    float fAngle = [self imageOrientationAngle];
    
    if (device.orientation == UIDeviceOrientationPortrait)
    {
        if (fAngle < 1)
        {
            [self rotateToRoriginalPosition];
        }
    }
    else if (device.orientation == UIDeviceOrientationLandscapeLeft)
    {
        if (fAngle > 1)
        {
            [self rotateVideoToLeft];
        }
    }
    
}

- (float) imageOrientationAngle
{
    //Use fAngle to check the rotation of the image
    float fAngle = atan2f(imgLogo.transform.a, imgLogo.transform.b);
    fAngle = fAngle * (180/M_PI);
    
    return fAngle;
}

- (void) rotateToRoriginalPosition
{
    imgLogo.image = [UIImage new];
    
    imgLogo.translatesAutoresizingMaskIntoConstraints = NO;
    
    [UIView animateWithDuration:0.7 animations:^{
        
        imgLogo.transform = CGAffineTransformRotate(imgLogo.transform, (-90 * M_PI / 180));
        
        myVideoLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 0.47);
        
        [self.view layoutIfNeeded];
        
    }];
}

- (void) rotateVideoToLeft
{
    
    imgLogo.translatesAutoresizingMaskIntoConstraints = YES;
    
    [UIView animateWithDuration:0.7 animations:^{
        
        imgLogo.transform = CGAffineTransformRotate(imgLogo.transform, (90 * M_PI / 180));
        
        imgLogo.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        myVideoLayer.frame = CGRectMake(0, 0, imgLogo.frame.size.height, imgLogo.frame.size.width);
        
    }completion:^(BOOL finished) {
        
        imgLogo.image = [UIImage imageNamed:@"ucadoLogo"];
    }];
}

@end
