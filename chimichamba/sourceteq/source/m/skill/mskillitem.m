#import "mskillitem.h"
#import "tools.h"

@implementation mskillitem

-(instancetype)init:(NSString*)name
{
    self = [super init];
    self.name = name;
    self.comparename = name.lowercaseString;
    
    return self;
}

#pragma mark public

-(BOOL)equalsskill:(mskillitem*)skill
{
    BOOL equals;
    
    equals = [self isKindOfClass:[skill class]];
    
    return equals;
}

-(BOOL)resultforquery:(NSString*)query
{
    BOOL result = NO;
    
    if([self.name rangeOfString:query].location != NSNotFound)
    {
        result = YES;
    }
    
    return result;
}

@end