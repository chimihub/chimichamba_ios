#import "vprofilepicture.h"

@implementation vprofilepicture

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *circle = [[UIView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setClipsToBounds:YES];
    [circle setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [circle.layer setBorderWidth:1];
    [circle.layer setBorderColor:[UIColor blackColor].CGColor];
    self.circle = circle;
    
    [self addSubview:circle];
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[circle]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[circle]-5-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    __weak typeof(self) welf = self;
    CGFloat width = welf.circle.bounds.size.width;
    CGFloat radius = width / 2.0;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       welf.circle.layer.cornerRadius = radius;
                   });
    
    [super layoutSubviews];
}

@end