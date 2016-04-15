#import "vemployee.h"
#import "cemployee.h"
#import "vemployeebar.h"

@interface vemployee ()

@property(weak, nonatomic)cemployee *controller;

@end

@implementation vemployee

@dynamic controller;

-(instancetype)init:(cemployee*)controller
{
    self = [super init:controller];
    
    vemployeebar *bar = [[vemployeebar alloc] init:controller];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end