#import "uifont+uifontmain.h"

@implementation UIFont (uifontmain)

+(instancetype)regularsize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}

+(instancetype)boldsize:(CGFloat)size
{
    return [UIFont boldSystemFontOfSize:size];
}

@end