#import "vprofilepicture.h"

static NSInteger const circlemargin = 5;

@implementation vprofilepicture

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *circle = [[UIView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setClipsToBounds:YES];
    [circle setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [circle.layer setBorderWidth:1];
    [circle.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.5].CGColor];
    self.circle = circle;
    
    [self addSubview:circle];
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{@"circlemargin":@(circlemargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(circlemargin)-[circle]-(circlemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(circlemargin)-[circle]-(circlemargin)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    __weak typeof(self) welf = self;
    CGFloat width = welf.bounds.size.width;
    CGFloat remain = width - (circlemargin * 2);
    CGFloat radius = remain / 2.0;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       welf.circle.layer.cornerRadius = radius;
                   });
    
    [super layoutSubviews];
}

@end