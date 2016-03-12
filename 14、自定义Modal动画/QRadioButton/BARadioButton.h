//
//  BARadioButton.h
//  14、自定义Modal动画
//
//  Created by 博爱之家 on 16/1/7.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BARadioButtonDelegate;

@interface BARadioButton : UIButton
{
    NSString                        *_groupId;
    BOOL                             _checked;
    id<BARadioButtonDelegate>         delegate;
}

@property(nonatomic, assign)id<BARadioButtonDelegate>   delegate;
@property(nonatomic, copy, readonly)NSString            *groupId;
@property(nonatomic, assign)BOOL checked;

- (id)initWithDelegate:(id)delegate groupId:(NSString*)groupId;

@end

@protocol BARadioButtonDelegate <NSObject>

@optional

- (void)didSelectedRadioButton:(BARadioButton *)radio groupId:(NSString *)groupId;

@end
