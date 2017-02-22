//
//  AppDelegate.m
//  Medium
//
//  Created by macmini on 02/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize lblLoaderBG;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // For initialize GlobalGDXData class
    [GlobalGDXData sharedData];

    // Override point for customization after application launch.
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
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Set Border
-(void)setBorderToView:(UIView *)view withBorderWidth:(float)width radious:(float)radious color:(UIColor *)bordercolor
{
    view.layer.borderWidth = width;
    view.layer.borderColor = [bordercolor CGColor];
    view.layer.cornerRadius = radious;
    view.layer.masksToBounds = YES;
}

#pragma mark - Show-Hide Loader Loader
-(void)showLoader:(NSString *)str
{
    [self hideLoader];
    [GMDCircleLoader hideFromView:self.window animated:YES];
    
    [lblLoaderBG removeFromSuperview];
    lblLoaderBG = [[UILabel alloc]initWithFrame:self.window.frame];
    lblLoaderBG.backgroundColor = [UIColor blackColor];
    lblLoaderBG.alpha = 0.5;
    [self.window addSubview:lblLoaderBG];
    self.window.userInteractionEnabled = NO;
    [GMDCircleLoader setOnView:self.window withTitle:@"" animated:YES];
}
-(void)hideLoader
{
    /*
    [GMDCircleLoader hideFromView:self.window animated:YES];
    self.window.userInteractionEnabled = YES;
    [lblLoaderBG removeFromSuperview];
     */
}
#pragma mark - Hide-Show Animation
- (void)animateWithShow:(BOOL)show withView:(UIView *)animatedView
{
    if (show == YES)
    {
        animatedView.alpha = 0;
        animatedView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^{
            animatedView.alpha = 1;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            animatedView.alpha = 0;
        } completion: ^(BOOL finished) {
            animatedView.alpha = 0;
            animatedView.hidden = finished;//if animation is finished ("finished" == *YES*), then hidden = "finished" ... (aka hidden = *YES*)
        }];
    }
}
#pragma mark - Share Controller
-(void)share:(NSString *)textToShare Link:(NSURL *)url
{
    //NSString *textToShare = @"Look at this awesome website for hiring iOS Developers!";
    //NSURL *myWebsite = [NSURL URLWithString:@"http://www.rlogical.com/"];
    
    NSArray *objectsToShare = @[textToShare, url];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo,
                                   UIActivityTypeMail,
                                   UIActivityTypeMessage];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self.window.rootViewController presentViewController:activityVC animated:YES completion:nil];
}


@end
