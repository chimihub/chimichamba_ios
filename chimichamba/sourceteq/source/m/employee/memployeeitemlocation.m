#import "memployeeitemlocation.h"
#import "vemployeecelllocation.h"

static NSUInteger const cellheight = 260;

@implementation memployeeitemlocation

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecelllocation class];
    self.height = cellheight;
    
    return self;
}

@end