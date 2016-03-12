//
//  ViewController.m
//  14、自定义Modal动画
//
//  Created by 博爱之家 on 16/1/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "BASecondViewController.h"
#import "BATransition.h"
#import "BASliderViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *backLabel;


- (IBAction)itemClick:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    BASecondViewController *vc = [[BASecondViewController alloc] init];
//    
//    vc.modalPresentationStyle = UIModalPresentationCustom;
//    vc.transitioningDelegate = [BATransition sharedtransition];
//    
//    [self presentViewController:vc animated:YES completion:nil];
    
    BASliderViewController *vc = [[BASliderViewController alloc] init];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = [BATransition sharedtransition];
    
    [vc backSelectIndex:^(NSInteger index) {
        self.backLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)index];
    }];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}

// storyboard转场时用到
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    UIViewController *destVc = [[UIViewController alloc] init];
//    destVc.transitioningDelegate = [BATransition sharedtransition];
//}

// storyboard转场时用到(不用Segue跳转时)
- (IBAction)itemClick:(id)sender
{
    UIViewController *destVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"three"];
    destVc.modalPresentationStyle = UIModalPresentationCustom;
    destVc.transitioningDelegate = [BATransition sharedtransition];
    
    [self presentViewController:destVc animated:YES completion:nil];
}

@end
