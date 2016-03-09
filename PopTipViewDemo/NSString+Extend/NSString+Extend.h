//
//  NSString+Extend.h
//  crm
//
//  Created by hexin on 14-11-5.
//  Copyright (c) 2014年 hexin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString(Extend)
- (CGSize)getSizeWithFont:(UIFont*)font maxWidth:(NSInteger)width textview:(BOOL)bTextView;
- (CGSize)getSizeWithFont:(UIFont*)font textview:(BOOL)bTextView;
@end
