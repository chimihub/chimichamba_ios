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
    
    vprofilebar *bar = [[vprofilebar alloc] init:controller];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end