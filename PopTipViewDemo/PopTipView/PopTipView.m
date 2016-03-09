//
//  PopTipView.m
//  HXCoach
//
//  Created by pqt on 15/11/27.
//  Copyright © 2015年 hexin. All rights reserved.
//

#import "PopTipView.h"
#import "HexColors.h"
#import "NSString+Extend.h"

#define TIPLABEL_XPADDING 4.5

#define TIPLABEL_YPADDING 5

#define HXPQT_POPVIEW_WIDTH 85

#define HXPQT_POPVIEW_HEIGHT 85

#define HXPQT_POPVIEW_NETWORKERROR_WIDTH 100

#define HXPQT_POPVIEW_NETWORKERROR_HEIGHT 95

#define HXPQT_POPVIEW_NETWORKEXCEPTION_WIDTH 130

#define HXPQT_POPVIEW_NETWORKEXCEPTION_HEIGHT 95

@interface PopTipView ()

@property (strong,nonatomic) UILabel *tipLabel;

@end

@implementation PopTipView

+(instancetype)sharePopTipView
{
    static PopTipView *popTipView;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        popTipView = [[PopTipView alloc] initWithFrame:CGRectMake(0, 0, HXPQT_POPVIEW_WIDTH, HXPQT_POPVIEW_HEIGHT)];
    });
    
    return popTipView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setup];
    }
    
    return self;
}

-(void)setup
{
    [self setBackgroundColor:[UIColor colorWithHexString:@"333333"]];
    self.alpha = 0.9;
    self.layer.cornerRadius = 20.f;
    
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.tipLabel setBackgroundColor:[UIColor clearColor]];
    [self.tipLabel setFont:[UIFont systemFontOfSize:16.f]];
    [self.tipLabel setTextColor:[UIColor whiteColor]];
    [self.tipLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.tipLabel];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.tipLabel setFrame:CGRectMake(TIPLABEL_XPADDING, TIPLABEL_YPADDING, self.frame.size.width - TIPLABEL_XPADDING * 2, self.frame.size.height - TIPLABEL_YPADDING * 2)];
}

-(void)setTipText:(NSString *)tipText
{
    [self.tipLabel setText:tipText];
    
    [self setNeedsDisplay];
}

+(instancetype)showInView:(UIView *)superView wihtTipText:(NSString *)tipStr
{
    PopTipView *popView = nil;
    
    if (superView && [superView isKindOfClass:[UIView class]])
    {
        CGFloat width = 0.f;
        CGSize textSize = [tipStr getSizeWithFont:[UIFont systemFontOfSize:16.f] textview:NO];
        if (textSize.width >= HXPQT_POPVIEW_WIDTH - 16)
        {
            width = textSize.width + 16;
            popView = [[PopTipView alloc] initWithFrame:CGRectMake(0, 0, width, HXPQT_POPVIEW_HEIGHT)];
        }
        else
        {
            popView = [[PopTipView alloc] initWithFrame:CGRectMake(0, 0, HXPQT_POPVIEW_WIDTH, HXPQT_POPVIEW_HEIGHT)];
        }
        
        
        popView.tipLabel.numberOfLines = 1;
        
        [popView setFrame:CGRectMake( (superView.bounds.size.width - popView.bounds.size.width ) / 2, (superView.bounds.size.height - popView.bounds.size.height )/2, popView.bounds.size.width, popView.bounds.size.height)];
        
        popView.tipLabel.text = tipStr;
        
        [superView addSubview:popView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [popView removeFromSuperview];
                
        });
    }
    
    return popView;
}

+(instancetype)showInView:(UIView *)superView wihtTipText:(NSString *)tipStr bounds:(CGSize)bounds fontSize:(CGFloat)size
{
    PopTipView *popView = nil;
    
    if (superView && [superView isKindOfClass:[UIView class]])
    {
        popView = [[PopTipView alloc] initWithFrame:CGRectMake(0, 0, bounds.width, bounds.height)];
        
        popView.center = superView.center;
        
        popView.tipLabel.numberOfLines = 0;

        popView.tipLabel.font = [UIFont systemFontOfSize:size];
        
        popView.tipLabel.text = tipStr;
        
        [popView.tipLabel setBackgroundColor:[UIColor clearColor]];
        
        [superView addSubview:popView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [popView removeFromSuperview];
            
        });
    }
    
    return popView;
}

+(instancetype)showInView:(UIView *)superView wihtNetWorkErrorTipText:(NSString *)tipStr
{
    PopTipView *popView = nil;
    
    if (superView && [superView isKindOfClass:[UIView class]])
    {
        popView = [[PopTipView alloc] initWithFrame:CGRectMake(0, 0, HXPQT_POPVIEW_NETWORKERROR_WIDTH, HXPQT_POPVIEW_NETWORKERROR_HEIGHT)];
        
        popView.center = superView.center;
        
        popView.tipLabel.text = tipStr;
        
        popView.tipLabel.numberOfLines = 0;
        
        [popView.tipLabel setTextAlignment:NSTextAlignmentCenter];
        
        [superView addSubview:popView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [popView removeFromSuperview];
            
        });
    }
    
    return popView;
}

+(instancetype)showInView:(UIView *)superView wihtNetWorkExceptionTipText:(NSString *)tipStr
{
    PopTipView *popView = nil;
    
    if (superView && [superView isKindOfClass:[UIView class]])
    {
        popView = [[PopTipView alloc] initWithFrame:CGRectMake(0, 0, HXPQT_POPVIEW_NETWORKEXCEPTION_WIDTH, HXPQT_POPVIEW_NETWORKEXCEPTION_HEIGHT)];
        
        popView.center = superView.center;
        
        popView.tipLabel.text = tipStr;
        
        popView.tipLabel.numberOfLines = 0;
        
        [popView.tipLabel setTextAlignment:NSTextAlignmentCenter];
        
        [superView addSubview:popView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [popView removeFromSuperview];
            
        });
    }
    
    return popView;
}

-(void)setTipLabelFontSize:(CGFloat)size
{
    [self.tipLabel setFont:[UIFont systemFontOfSize:size]];
    [self setNeedsDisplay];
}

@end
