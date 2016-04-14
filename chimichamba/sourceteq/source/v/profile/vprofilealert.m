#import "vprofilealert.h"
#import "vblur.h"
#import "uibutton+uibuttonmain.h"

@implementation vprofilealert

-(instancetype)init:(cprofile*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    vblur *blur = [vblur light:NO];
    
    UIButton *buttoncancel = [UIButton main:NSLocalizedString(@"profile_alert_button_cancel", nil)];
    [buttoncancel addTarget:self action:@selector(actioncancel:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:buttoncancel];
    
    NSDictionary *views = @{@"blur":blur, @"buttoncancel":buttoncancel};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[buttoncancel]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[buttoncancel]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioncancel:(UIButton*)button
{
    [self removeFromSuperview];
}

@end