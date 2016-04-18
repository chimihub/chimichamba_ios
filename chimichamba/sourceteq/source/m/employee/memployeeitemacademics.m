#import "memployeeitemacademics.h"
#import "vemployeecellacademics.h"

static NSUInteger const cellheight = 150;

@implementation memployeeitemacademics

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecellacademics class];
    self.height = cellheight;
    self.items = @[@"A", @"B"];
    
    return self;
}

@end