//
//  BAThreeViewController.h
//  14、自定义Modal动画
//
//  Created by 博爱之家 on 16/1/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectIndex)(NSUInteger index);

@interface BAThreeViewController : UIViewController

- (void)backSelectIndex:(selectIndex)index;

@end
