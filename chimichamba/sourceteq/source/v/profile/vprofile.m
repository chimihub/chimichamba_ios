#import "vprofile.h"
#import "vprofilebar.h"

@interface vprofile ()

@property(weak, nonatomic)cprofile *controller;

@end

@implementation vprofile

@dynamic controller;

-(instancetype)init:(cprofile*)controller
{
    self = [super init:controller];
    
    return self;
}

@end