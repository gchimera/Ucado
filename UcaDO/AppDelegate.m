//
//  AppDelegate.m
//  UcaDO
//
//  Created by Hamid Mehmood on 14/02/17.
//  Copyright © 2017 Hamid Mehmood. All rights reserved.
//

#import "AppDelegate.h"
#import <sys/utsname.h>
#import <Foundation/Foundation.h>
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <AFNetworking/AFNetworking.h>
#import "Constant.h"
#import "SAMKeychain.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "Harpy.h"
#import "BurgerMenuVC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
//    [Fabric with:@[[Crashlytics class]]];
    
    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"tutorial"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginRegister" bundle:[NSBundle mainBundle]];
        UIViewController *vc =[storyboard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];
    } else {
        
        
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"tutorial"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
    
    
    
    // get the device type
    //    struct utsname systemInfo;
    //
    //    uname(&systemInfo);
    //
    //    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //
    //    if(platform)
    //    {
    //        NSString *device_type = [UIDevice currentDevice].systemName;
    //        [[NSUserDefaults standardUserDefaults] setObject:device_type forKey:@"device_type"];
    //        NSLog(@"device_type::%@",device_type);
    //    }
    //    [self getUniqueDeviceIdentifierAsString];
    
    
    //    // get device ID
    //    [self getDeviceID];
    
    // get device platform
    [self platformString];
    
    
    //Facebook Instance
//    [[FBSDKApplicationDelegate sharedInstance] application:application
//                             didFinishLaunchingWithOptions:launchOptions];
//    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    //Push notification
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil];
        
        [application registerUserNotificationSettings:settings];
    }
    
    //Subscribe to check internet connection
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:UCK_InternetConnectionLost object:nil];
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // Present Window before calling Harpy
    [self.window makeKeyAndVisible];
    
    // Set the UIViewController that will present an instance of UIAlertController
    [[Harpy sharedInstance] setPresentingViewController:_window.rootViewController];
    
    // (Optional) Set the Delegate to track what a user clicked on, or to use a custom UI to present your message.
    [[Harpy sharedInstance] setDelegate:self];
    
    // (Optional) The tintColor for the alertController
    //    [[Harpy sharedInstance] setAlertControllerTintColor:[UIColor purpleColor]];
    
    // (Optional) Set the App Name for your app
    [[Harpy sharedInstance] setAppName:@"UcaDO"];
    
    /* (Optional) Set the Alert Type for your app
     By default, Harpy is configured to use HarpyAlertTypeOption */
    [[Harpy sharedInstance] setAlertType:HarpyAlertTypeForce];
    
    /* (Optional) If your application is not available in the U.S. App Store, you must specify the two-letter
     country code for the region in which your applicaiton is available. */
    //     [[Harpy sharedInstance] setCountryCode:@"en-EN"];
    
    /* (Optional) Overrides system language to predefined language.
     Please use the HarpyLanguage constants defined in Harpy.h. */
    //    [[Harpy sharedInstance] setForceLanguageLocalization:HarpyLanguageRussian];
    
    // Turn on Debug statements
    [[Harpy sharedInstance] setDebugEnabled:true];
    
    // Perform check for new version of your app
    [[Harpy sharedInstance] checkVersion];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Perform check for new version of your app
     Useful if user returns to you app from background after being sent tot he App Store,
     but doesn't update their app before coming back to your app.
     
     ONLY USE THIS IF YOU ARE USING *HarpyAlertTypeForce*
     
     Also, performs version check on first launch.
     */
    [[Harpy sharedInstance] checkVersion];
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    /*
     Perform daily check for new version of your app
     Useful if user returns to you app from background after extended period of time
     Place in applicationDidBecomeActive:
     
     Also, performs version check on first launch.
     */
    [[Harpy sharedInstance] checkVersionDaily];
    
    /*
     Perform weekly check for new version of your app
     Useful if you user returns to your app from background after extended period of time
     Place in applicationDidBecomeActive:
     
     Also, performs version check on first launch.
     */
    [[Harpy sharedInstance] checkVersionWeekly];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation {
//    
//    return [[FBSDKApplicationDelegate sharedInstance] application:application
//                                                          openURL:url
//                                                sourceApplication:sourceApplication
//                                                       annotation:annotation];
//}

#pragma -mark UUID or NSUUID

- (NSString*)UUIDString {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge NSString *)string;
}

- (NSString *) getDeviceID
{
    NSString * devicetempid = [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceIdentifier"];
    NSString *deviceID;
    
    if (devicetempid == nil || [devicetempid length] < 4) {
        deviceID = [self UUIDString];
        [[NSUserDefaults standardUserDefaults] setObject:deviceID forKey:@"deviceIdentifier"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"device id :%@",deviceID);
        return deviceID;
    } else {
        NSLog(@"tempid :%@",devicetempid);
        return devicetempid;
    }
    
}

- (NSUserDefaults *) platformString
{
    NSUserDefaults * device = [NSUserDefaults standardUserDefaults];
    
    [device setObject:@"unknown" forKey:@"device_info"];
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    //    NSLog(@"systemInfo.machine: %@",[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if(platform)
    {
        
        NSMutableDictionary *deviceType = [[NSMutableDictionary alloc]init];
        
        [deviceType setObject:[UIDevice currentDevice].model forKey:@"deviceModel"];
        [deviceType setObject:[UIDevice currentDevice].description forKey:@"deviceModel"];
        [deviceType setObject:[UIDevice currentDevice].localizedModel forKey:@"localizedModel"];
        [deviceType setObject:[UIDevice currentDevice].name forKey:@"name"];
        [deviceType setObject:[UIDevice currentDevice].systemVersion forKey:@"systemVersion"];
        [deviceType setObject:[[UIDevice currentDevice].systemName lowercaseString] forKey:@"device_type"];
        [deviceType setObject:[self getDeviceID] forKey:@"device_token"];
        
        [device setObject:deviceType forKey:@"device_info"];
        
        
        NSLog(@"device_info ::%@",deviceType);
        
        return device;
    }
    else
    {
        NSLog(@"device_info :%@",device);
        
        return device;
    }
    
}




#pragma mark NOTIFICATIONS

- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    //Format token as need
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    // save temp
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"device_token"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isDevice_token"];
    
    NSLog(@"device_token:%@",token);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
    if (application.applicationState == UIApplicationStateActive)
    {
        NSString *identifier = [[(NSDictionary *)userInfo objectForKey:@"aps"] objectForKey:@"alert"];
        
        //handle the actions
        if ([identifier rangeOfString:UCK_NewMessage].location != NSNotFound)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:UCK_NewMessage object:userInfo];
        }
        
    }
    else
    {
        // Do something else rather than showing an alert view, because it won't be displayed.
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:1];
    }
    
    
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    
    //register to receive notifications
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
{
    
}

//-(NSString *)getUniqueDeviceIdentifierAsString
//{
//    NSString *appName=[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey];
//
//    NSString *strApplicationUUID = [SAMKeychain passwordForService:appName account:@"incoding"];
//    if (strApplicationUUID == nil)
//    {
//        strApplicationUUID  = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//        [SAMKeychain setPassword:strApplicationUUID forService:appName account:@"incoding"];
//    }
//
//    NSLog(@"startApp:%@",strApplicationUUID)
//    return strApplicationUUID;
//}


#pragma mark - HarpyDelegate
- (void)harpyDidShowUpdateDialog
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)harpyUserDidLaunchAppStore
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)harpyUserDidSkipVersion
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)harpyUserDidCancel
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)harpyDidDetectNewVersionWithoutAlert:(NSString *)message
{
    NSLog(@"%@", message);
}

@end
