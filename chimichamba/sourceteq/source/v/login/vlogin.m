#import "vlogin.h"
#import "uibutton+uibuttonmain.h"
#import "uicolor+uicolormain.h"
#import "clogin.h"

@interface vlogin ()

@property(weak, nonatomic)clogin *controller;

@end

@implementation vlogin

@dynamic controller;

-(instancetype)init:(clogin*)controller
{
    self = [super init:controller];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont systemFontOfSize:24]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextColor:[UIColor blackColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:NSLocalizedString(@"login_title", nil)];
    
    UILabel *motto = [[UILabel alloc] init];
    [motto setBackgroundColor:[UIColor clearColor]];
    [motto setUserInteractionEnabled:NO];
    [motto setFont:[UIFont systemFontOfSize:18]];
    [motto setTranslatesAutoresizingMaskIntoConstraints:NO];
    [motto setTextColor:[UIColor second]];
    [motto setTextAlignment:NSTextAlignmentCenter];
    [motto setText:NSLocalizedString(@"app_motto", nil)];
    
    UIView *titleborder = [[UIView alloc] init];
    [titleborder setUserInteractionEnabled:NO];
    [titleborder setClipsToBounds:YES];
    [titleborder setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleborder setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    
    UIImageView *logo = [[UIImageView alloc] init];
    [logo setUserInteractionEnabled:NO];
    [logo setClipsToBounds:YES];
    [logo setContentMode:UIViewContentModeScaleAspectFit];
    [logo setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logo setImage:[UIImage imageNamed:@"generic_logo"]];
    
    UIButton *buttonfacebook = [UIButton main:NSLocalizedString(@"login_btn_facebook", nil)];
    [buttonfacebook addTarget:self action:@selector(actionprofile:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonfacebook = buttonfacebook;
    
    UIButton *buttonemail = [UIButton second:NSLocalizedString(@"login_btn_email", nil)];
    [buttonemail addTarget:self action:@selector(actionprofile:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonemail = buttonemail;
    
    [self addSubview:titleborder];
    [self addSubview:motto];
    [self addSubview:title];
    [self addSubview:buttonfacebook];
    [self addSubview:buttonemail];
    [self addSubview:logo];
    
    NSDictionary *views = @{@"title":title, @"titleborder":titleborder, @"btnface":buttonfacebook, @"btnemail":buttonemail, @"logo":logo, @"motto":motto};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[motto]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[titleborder]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnface]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnemail]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[logo]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[title(30)]-10-[titleborder(1)]-40-[logo(170)]-10-[motto(25)]-70-[btnface(50)]-20-[btnemail(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionprofile:(UIButton*)button
{
    [self.controller profile];
}

@end