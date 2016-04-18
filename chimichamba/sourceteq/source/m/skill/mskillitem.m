#import "mskillitem.h"

@implementation mskillitem

#pragma mark public

-(BOOL)equalsskill:(mskillitem*)skill
{
    BOOL equals;
    
    equals = [self isKindOfClass:[skill class]];
    
    return equals;
}

@end