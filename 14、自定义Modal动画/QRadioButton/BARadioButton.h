//
//  EIRadioButton.h
//  EInsure
//
//  Created by ivan on 13-7-9.
//  Copyright (c) 2013年 ivan. All rights reserved.
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
