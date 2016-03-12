//
//  BASliderViewController.m
//  14、自定义Modal动画
//
//  Created by 博爱 on 16/3/12.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "BASliderViewController.h"
#import "BARadioButton.h"

#define KSCREEN_HEIGHT   (CGRectGetHeight(self.view.frame))
#define KSCREEN_WIDTH    (CGRectGetWidth(self.view.frame))

#define KFontSize(size) [UIFont systemFontOfSize:size]
// 颜色
#define KCOLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
// 随机色
#define YRRandomColor      [UIColor colorWithRed:arc4random_uniform(256)%255.0 green:arc4random_uniform(256)%255.0 blue:arc4random_uniform(256)%255.0 alpha:1.0]
// navi蓝色
#define NaviBgBlueColor    KCOLOR(92, 177, 251, 1.0)
#define kWHITECOLOR        [UIColor whiteColor]
#define kBGGrayColor       KCOLOR(239, 239, 239, 1.0)
#define kTEXTGrayColor     KCOLOR(148, 147, 133, 1.0)
#define kBLUEColor         KCOLOR(78, 164, 255, 1.0)

@interface BASliderViewController ()

@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, copy)  SelectIndex indexData;

@end

@implementation BASliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIView* bg_view = [UIView new];
    bg_view.frame = self.view.frame;
    bg_view.backgroundColor = [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:0.7f];
    [self.view addSubview:bg_view];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 0, KSCREEN_WIDTH - 100, KSCREEN_HEIGHT)];
    view.backgroundColor = kBGGrayColor;
    view.layer.cornerRadius = 5.0f;
    
    UIView *titleView = [UIView new];
    titleView.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), 64);
    titleView.backgroundColor = NaviBgBlueColor;
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleButton.frame = CGRectMake(10, 20, 40, 44);
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancleButton.titleLabel.font = KFontSize(15);
    [cancleButton addTarget:self action:@selector(clickCancleButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(CGRectGetMaxX(cancleButton.frame), 20, CGRectGetWidth(titleView.frame) - 2*50, 44);
    titleLabel.text = @"筛选";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = KFontSize(17);
    
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 20, 40, 44);
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureButton.titleLabel.font = KFontSize(15);
    [sureButton addTarget:self action:@selector(clickSureButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [titleView addSubview:cancleButton];
    [titleView addSubview:titleLabel];
    [titleView addSubview:sureButton];
    [view addSubview:titleView];
    
    UIView *view1 = [UIView new];
    view1.frame = CGRectMake(0, CGRectGetMaxY(titleView.frame), CGRectGetWidth(view.frame), 44);
    view1.backgroundColor = [UIColor whiteColor];
    
    UILabel *playCountLabel = [UILabel new];
    playCountLabel.frame = CGRectMake(10, 0, 60, 44);
    playCountLabel.text = @"播放次数";
    playCountLabel.font = KFontSize(14);
    
    BARadioButton *ascendButton1 = [[BARadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    CGRect ascendButton1Frame = CGRectMake(CGRectGetMaxX(playCountLabel.frame) + 20, 0, 80, 44);
    ascendButton1.frame = ascendButton1Frame;
    [ascendButton1 setTitle:@"升序" forState:UIControlStateNormal];
    [ascendButton1 setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];
    [ascendButton1 setTitleColor:NaviBgBlueColor forState:UIControlStateSelected];
    [ascendButton1.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [ascendButton1 setChecked:YES];
    [ascendButton1 addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    ascendButton1.tag = 1;
    
    BARadioButton *descendButton1 = [[BARadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    CGRect descendButton1Frame = CGRectMake(CGRectGetMaxX(ascendButton1.frame) + 20, 0, 80, 44);
    descendButton1.frame = descendButton1Frame;
    [descendButton1 setTitle:@"降序" forState:UIControlStateNormal];
    [descendButton1 setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];
    [descendButton1 setTitleColor:NaviBgBlueColor forState:UIControlStateSelected];
    [descendButton1.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [descendButton1 setChecked:NO];
    [descendButton1 addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    descendButton1.tag = 2;
    
    
    [view1 addSubview:playCountLabel];
    [view1 addSubview:ascendButton1];
    [view1 addSubview:descendButton1];
    
    [view addSubview:view1];
    
    
    UIView *view2 = [UIView new];
    view2.frame = CGRectMake(0, CGRectGetMaxY(view1.frame) + 1, CGRectGetWidth(view.frame), 44);
    view2.backgroundColor = [UIColor whiteColor];
    
    UILabel *updateLabel = [UILabel new];
    updateLabel.frame = CGRectMake(10, 0, 60, 44);
    updateLabel.text = @"更新时间";
    updateLabel.font = KFontSize(14);
    
    BARadioButton *ascendButton2 = [[BARadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    CGRect ascendButton2Frame = CGRectMake(CGRectGetMaxX(updateLabel.frame) + 20, 0, 80, 44);
    ascendButton2.frame = ascendButton2Frame;
    [ascendButton2 setTitle:@"升序" forState:UIControlStateNormal];
    [ascendButton2 setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];
    [ascendButton2 setTitleColor:NaviBgBlueColor forState:UIControlStateSelected];
    [ascendButton2.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [ascendButton2 setChecked:NO];
    [ascendButton2 addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    ascendButton2.tag = 3;
    
    
    BARadioButton *descendButton2 = [[BARadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    CGRect descendButton2Frame = CGRectMake(CGRectGetMaxX(ascendButton2.frame) + 20, 0, 80, 44);
    descendButton2.frame = descendButton2Frame;
    [descendButton2 setTitle:@"降序" forState:UIControlStateNormal];
    [descendButton2 setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];
    [descendButton2 setTitleColor:NaviBgBlueColor forState:UIControlStateSelected];
    [descendButton2.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [descendButton2 setChecked:NO];
    [descendButton2 addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    descendButton2.tag = 4;
    
    
    [view2 addSubview:updateLabel];
    [view2 addSubview:ascendButton2];
    [view2 addSubview:descendButton2];
    [view addSubview:view2];
    
    UIView *view3 = [UIView new];
    view3.frame = CGRectMake(0, CGRectGetMaxY(view2.frame) + 1, CGRectGetWidth(view.frame), 44);
    view3.backgroundColor = [UIColor whiteColor];
    
    UILabel *commentLabel = [UILabel new];
    commentLabel.frame = CGRectMake(10, 0, 60, 44);
    commentLabel.text = @"评论次数";
    commentLabel.font = KFontSize(14);
    
    BARadioButton *ascendButton3 = [[BARadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    CGRect ascendButton3Frame = CGRectMake(CGRectGetMaxX(commentLabel.frame) + 20, 0, 80, 44);
    ascendButton3.frame = ascendButton3Frame;
    [ascendButton3 setTitle:@"升序" forState:UIControlStateNormal];
    [ascendButton3 setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];
    [ascendButton3 setTitleColor:NaviBgBlueColor forState:UIControlStateSelected];
    [ascendButton3.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [ascendButton3 setChecked:NO];
    [ascendButton3 addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    ascendButton3.tag = 5;
    
    
    BARadioButton *descendButton3 = [[BARadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    CGRect descendButton3Frame = CGRectMake(CGRectGetMaxX(ascendButton3.frame) + 20, 0, 80, 44);
    descendButton3.frame = descendButton3Frame;
    [descendButton3 setTitle:@"降序" forState:UIControlStateNormal];
    [descendButton3 setTitleColor:kTEXTGrayColor forState:UIControlStateNormal];
    [descendButton3 setTitleColor:NaviBgBlueColor forState:UIControlStateSelected];
    [descendButton3.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [descendButton3 setChecked:NO];
    [descendButton3 addTarget:self action:@selector(clickSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    descendButton3.tag = 6;
    
    
    [view3 addSubview:commentLabel];
    [view3 addSubview:ascendButton3];
    [view3 addSubview:descendButton3];
    [view addSubview:view3];
    
    [bg_view addSubview:view];
}

- (IBAction)clickCancleButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickSelectButton:(UIButton *)sender
{
    NSLog(@"选择了 第%ld个 button ! ", (long)sender.tag);
    self.selectIndex = sender.tag;
}

- (IBAction)clickSureButton:(UIButton *)sender
{
    if (self.indexData)
    {
        self.indexData(self.selectIndex);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)backSelectIndex:(SelectIndex)index
{
    self.indexData = index;
}



@end
