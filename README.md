# BAModelViewController

1、自定义modele动画可以实现很多推出动画
具体看效果：

2、具体步骤：（两部）
第一步：导入头文件  
#import "BATransition.h"

第二步：推出VC的代码
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event 
{
    BASliderViewController *vc = [[BASliderViewController alloc] init];

    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = [BATransition sharedtransition];

    // 这里是回调函数
    [vc backSelectIndex:^(NSInteger index) {
    self.backLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)index];
    }];

    [self presentViewController:vc animated:YES completion:nil];
}

3、示例图：

![image](https://github.com/boai/BAModelViewController/blob/master/firstImage.png)
![image](https://github.com/boai/BAModelViewController/blob/master/secondImage.png)





