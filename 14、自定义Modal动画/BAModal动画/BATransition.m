//
//  BATransition.m
//  160105_ UIAlertController
//
//  Created by 博爱之家 on 16/1/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BATransition.h"
#import "BAPresentationController.h"
#import "BAAnimatedTransitioning.h"

@implementation BATransition
SingletonM(transition)


/*
 1、导入头文件
 #import "BASecondViewController.h"
 #import "BATransition.h"

 2、跳转方法
 
 BASecondViewController *vc = [[BASecondViewController alloc] init];
 
 vc.modalPresentationStyle = UIModalPresentationCustom;
 vc.transitioningDelegate = [BATransition sharedtransition];
 
 [self presentViewController:vc animated:YES completion:nil];

 */

#pragma mark - UIViewControllerTransitioningDelegate
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[BAPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    BAAnimatedTransitioning *anim = [[BAAnimatedTransitioning alloc] init];
    anim.presented = YES;
    return anim;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    BAAnimatedTransitioning *anim = [[BAAnimatedTransitioning alloc] init];
    anim.presented = NO;
    return anim;
}


@end
