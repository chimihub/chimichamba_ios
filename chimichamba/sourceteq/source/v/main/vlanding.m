#import "vlanding.h"

@implementation vlanding

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setUserInteractionEnabled:NO];
    
    return self;
}

@end