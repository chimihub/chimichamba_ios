#import "memployeeitemskill.h"
#import "vemployeecellskill.h"

static NSUInteger const cellheight = 100;

@implementation memployeeitemskill

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecellskill class];
    self.height = cellheight;
    
    return self;
}

@end