#import "vemployeeskillheader.h"

@implementation vemployeeskillheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont boldSystemFontOfSize:16]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mskillcat*)model
{
    [self.label setText:model.name];
}

@end