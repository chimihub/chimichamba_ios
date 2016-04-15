#import "vemployeecell.h"
#import "uicolor+uicolormain.h"

@implementation vemployeecell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor background]];
    
    return self;
}

@end