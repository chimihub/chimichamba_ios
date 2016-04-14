#import "vlogin.h"
#import "uibutton+uibuttonmain.h"

@implementation vlogin

-(instancetype)init:(UIViewController*)controller
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
    
    UIView *titleborder = [[UIView alloc] init];
    [titleborder setUserInteractionEnabled:NO];
    [titleborder setClipsToBounds:YES];
    [titleborder setTranslatesAutoresizingMaskIntoConstraints:NO];
    [titleborder setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    
    UIButton *buttonfacebook = [UIButton main:NSLocalizedString(@"login_btn_facebook", nil)];
    self.buttonfacebook = buttonfacebook;
    
    UIButton *buttonemail = [UIButton second:NSLocalizedString(@"login_btn_email", nil)];
    self.buttonemail = buttonemail;
    
    [self addSubview:titleborder];
    [self addSubview:title];
    [self addSubview:buttonfacebook];
    [self addSubview:buttonemail];
    
    NSDictionary *views = @{@"title":title, @"titleborder":titleborder, @"btnface":buttonfacebook, @"btnemail":buttonemail};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[titleborder]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnface]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnemail]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[title]-10-[titleborder(1)]-150-[btnface(50)]-20-[btnemail(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end