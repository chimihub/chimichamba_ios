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
    
    vblur *blur = [vblur dark];
    
    UIButton *buttoncamera = [UIButton main:NSLocalizedString(@"profile_alert_button_camera", nil)];
    [buttoncamera addTarget:self action:@selector(actioncamera:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonlibrary = [UIButton main:NSLocalizedString(@"profile_alert_button_library", nil)];
    [buttonlibrary addTarget:self action:@selector(actionlibrary:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttoncancel = [UIButton second:NSLocalizedString(@"profile_alert_button_cancel", nil)];
    [buttoncancel addTarget:self action:@selector(actioncancel:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:buttoncamera];
    [self addSubview:buttonlibrary];
    [self addSubview:buttoncancel];
    
    NSDictionary *views = @{@"blur":blur, @"buttoncancel":buttoncancel, @"buttoncamera":buttoncamera, @"buttonlibrary":buttonlibrary};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[buttoncamera]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[buttonlibrary]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[buttoncancel]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[buttoncamera]-20-[buttonlibrary]-70-[buttoncancel]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioncancel:(UIButton*)button
{
    [self removeFromSuperview];
}

-(void)actioncamera:(UIButton*)button
{
    [self.controller picturecamera];
    [self removeFromSuperview];
}

-(void)actionlibrary:(UIButton*)button
{
    [self.controller picturelibrary];
    [self removeFromSuperview];
}

@end