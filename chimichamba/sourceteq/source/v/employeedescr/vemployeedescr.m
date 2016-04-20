#import "vemployeedescr.h"

@implementation vemployeedescr

-(instancetype)init:(cemployeedescr*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    return self;
}

@end