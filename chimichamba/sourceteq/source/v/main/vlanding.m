#import "vlanding.h"

@implementation vlanding

-(instancetype)init:(UIViewController*)controller
{
    self = [super init:controller];
    [self setUserInteractionEnabled:NO];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setUserInteractionEnabled:NO];
    [logo setClipsToBounds:YES];
    [logo setContentMode:UIViewContentModeScaleAspectFit];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setImage:[UIImage imageNamed:@"generic_logo"]];
    
    [self addSubview:logo];
    
    NSDictionary *views = @{@"logo":logo};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[logo(170)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end