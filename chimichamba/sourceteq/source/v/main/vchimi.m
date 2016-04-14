#import "vchimi.h"

@implementation vchimi

-(instancetype)init:(UIViewController*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    UIImageView *background = [[UIImageView alloc] init];
    [background setClipsToBounds:YES];
    [background setUserInteractionEnabled:NO];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setContentMode:UIViewContentModeCenter];
    [background setImage:[UIImage imageNamed:@"generic_background"]];
    
    [self addSubview:background];
    
    NSDictionary *views = @{@"background":background};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[background]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end