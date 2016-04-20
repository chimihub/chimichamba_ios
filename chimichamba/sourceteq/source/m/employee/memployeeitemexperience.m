#import "memployeeitemexperience.h"
#import "vemployeecellexperience.h"

static NSUInteger const cellheight = 210;

@implementation memployeeitemexperience

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecellexperience class];
    self.height = cellheight;
    self.years = 0;
    self.rookie = YES;
    
    return self;
}

@end