//
//  PopTipView.h
//  HXCoach
//
//  Created by pqt on 15/11/27.
//  Copyright © 2015年 hexin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopTipView : UIView

@property (nonatomic,strong) NSString *tipText;

+(instancetype)showInView:(UIView *)superView wihtTipText:(NSString *)tipStr;
+(instancetype)showInView:(UIView *)superView wihtNetWorkErrorTipText:(NSString *)tipStr;
+(instancetype)showInView:(UIView *)superView wihtNetWorkExceptionTipText:(NSString *)tipStr;
+(instancetype)showInView:(UIView *)superView wihtTipText:(NSString *)tipStr bounds:(CGSize)bounds fontSize:(CGFloat)size;
-(void)setTipLabelFontSize:(CGFloat)size;
@end
