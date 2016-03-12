//
//  BAPresentationController.m
//  160105_ UIAlertController
//
//  Created by 博爱之家 on 16/1/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAPresentationController.h"

@implementation BAPresentationController


//- (CGRect)frameOfPresentedViewInContainerView
//{
//    
////    return CGRectMake(40, 50, self.containerView.frame.size.width - 80, self.containerView.frame.size.height - 100);
//    return CGRectInset(self.containerView.bounds, 5, 30);
//}

- (void)presentationTransitionWillBegin
{
//    NSLog(@"presentationTransitionWillBegin");
    
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
    
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
//    NSLog(@"presentationTransitionDidEnd");

}

- (void)dismissalTransitionWillBegin
{
//    NSLog(@"dismissalTransitionWillBegin");

}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
//    NSLog(@"dismissalTransitionDidEnd");

    [self.presentedView removeFromSuperview];
}




@end
