//
//  AppDelegate.m
//  rongyuanDemo
//
//  Created by macAir on 2019/9/18.
//  Copyright © 2019 WJQ. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#define appKey @"pwe86ga5pvwk6"

#define token @"DX74YDa13gMzfdLnsq7Hd6Kj1OSYg3/XT0SSpeNYzGt0uQ7Lpjnqwj7CxYXbH0nkndY+evywg/+tFIrQQiWb9g=="

@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
     {"code":200,"userId":"1044","token":"DX74YDa13gMzfdLnsq7Hd6Kj1OSYg3/XT0SSpeNYzGt0uQ7Lpjnqwj7CxYXbH0nkndY+evywg/+tFIrQQiWb9g=="}
     */
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:[MessageViewController new]];
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    
    
    
    [[RCIM sharedRCIM] initWithAppKey:appKey];
    
    [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
        
        
        NSLog(@"登录成功%@",userId);
        
        
    } error:^(RCConnectErrorCode status) {
        
        NSLog(@"登陆的错误码为:%zd", status);
    } tokenIncorrect:^{
        
        NSLog(@"token错误");
    }];
    
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    
    return YES;
}


-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
    
    RCUserInfo * info = [[RCUserInfo alloc]initWithUserId:userId name:@"qiangzi" portrait:@""];
    
    
   
    
    completion(info);
    
     NSLog(@"_________%@",info);
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
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
