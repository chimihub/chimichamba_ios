#import "memployeeitemexperience.h"
#import "vemployeecellexperience.h"

static NSUInteger const cellheight = 100;

@implementation memployeeitemexperience

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecellexperience class];
    self.height = cellheight;
    
    return self;
}

@end