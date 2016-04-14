#import "vlogin.h"

@implementation vlogin

-(instancetype)init:(clogin*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClipsToBounds:YES];
    self.controller = controller;
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont systemFontOfSize:24]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextColor:[UIColor blackColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:NSLocalizedString(@"login_title", nil)];
    
    UIView *titleborder = [[UIView alloc] init];
    [titleborder setUserInteractionEnabled:NO];
    [titleborder setClipsToBounds:YES];
    [titleborder setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleborder setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    
    [self addSubview:titleborder];
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title, @"titleborder":titleborder};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[titleborder]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[title]-10-[titleborder(1)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end