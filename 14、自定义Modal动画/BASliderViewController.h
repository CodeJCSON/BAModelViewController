//
//  FourViewController.h
//  14、自定义Modal动画
//
//  Created by 博爱 on 16/3/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectIndex)(NSInteger index);

@interface BASliderViewController : UIViewController

- (void)backSelectIndex:(SelectIndex)index;

@end
