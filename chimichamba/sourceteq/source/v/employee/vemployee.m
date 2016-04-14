#import "vemployee.h"
#import "cemployee.h"

@interface vemployee ()

@property(weak, nonatomic)cemployee *controller;

@end

@implementation vemployee

@dynamic controller;

-(instancetype)init:(cemployee*)controller
{
    self = [super init:controller];
    
    return self;
}

@end