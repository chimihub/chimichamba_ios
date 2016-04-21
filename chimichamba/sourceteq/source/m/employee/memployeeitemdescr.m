#import "memployeeitemdescr.h"
#import "vemployeecelldescr.h"

static NSUInteger const cellheight = 60;

@implementation memployeeitemdescr

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecelldescr class];
    self.height = cellheight;
    self.descr = @"";
    
    return self;
}

@end