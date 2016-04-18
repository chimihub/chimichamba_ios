#import "memployeeitemacademics.h"
#import "vemployeecellacademics.h"

static NSUInteger const cellheight = 100;

@implementation memployeeitemacademics

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecellacademics class];
    self.height = cellheight;
    
    return self;
}

@end