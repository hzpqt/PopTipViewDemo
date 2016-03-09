//
//  NSString+Extend.m
//  crm
//
//  Created by hexin on 14-11-5.
//  Copyright (c) 2014年 hexin. All rights reserved.
//

#import "NSString+Extend.h"

#define HANZI_START 19968
#define HANZI_COUNT 20902

@implementation NSString(Extend)

- (CGSize)getSizeWithFont:(UIFont*)font textview:(BOOL)bTextView
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize titleSize = [self sizeWithAttributes:attribute];
    if(bTextView)
        titleSize.height += 16;
    return titleSize;

}

//textview上下有8px的padding
- (CGSize)getSizeWithFont:(UIFont*)font maxWidth:(NSInteger)width textview:(BOOL)bTextView
{
    if(bTextView)
    {
        width -= 16;
    }
    CGSize maxSize=CGSizeMake(width, 99999);
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize strSize = [self boundingRectWithSize:maxSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    if(bTextView)
        strSize.height += 16;
    return strSize;
}
@end
