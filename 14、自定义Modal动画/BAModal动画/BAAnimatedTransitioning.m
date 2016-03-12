//
//  BAAnimatedTransitioning.m
//  160105_ UIAlertController
//
//  Created by 博爱之家 on 16/1/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BAAnimatedTransitioning.h"
#import "UIView+Extension.h"

const CGFloat duration = 1.0;

@implementation BAAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (self.presented)
    {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//        toView.layer.transform = CATransform3DMakeRotation(M_PI_2, 1.25, 2.58, 5.0);
//        toView.layer.transform = CATransform3DMakeRotation(M_PI_2, 1, 1, 0);

//        toView.y = -toView.height;
        toView.x = toView.width;
        [UIView animateWithDuration:duration animations:^{
            
            // 回零
            toView.layer.transform = CATransform3DIdentity;
            
//            toView.y = 0;
            toView.x = 0;
        }completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
   else
   {
       UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
       [UIView animateWithDuration:duration animations:^{
//           fromView.y = -fromView.height;
           fromView.x = fromView.width;
//           fromView.layer.transform = CATransform3DMakeRotation(M_PI_2, 1, 1, 0);
       } completion:^(BOOL finished) {
           [transitionContext completeTransition:YES];
       }];
   }
}

@end
