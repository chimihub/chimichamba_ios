#import "uibutton+uibuttonmain.h"
#import "uicolor+uicolormain.h"

static CGFloat const radius = 4;

@implementation UIButton (uibuttonmain)

+(instancetype)main:(NSString*)title
{
    UIButton *button = [UIButton button:title];
    [button setBackgroundColor:[UIColor main]];
    
    return button;
}

+(instancetype)second:(NSString*)title
{
    UIButton *button = [UIButton button:title];
    [button setBackgroundColor:[UIColor second]];
    
    return button;
}

#pragma mark private

+(instancetype)button:(NSString*)title
{
    UIButton *button = [[UIButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setClipsToBounds:YES];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [button.layer setCornerRadius:radius];
    
    return button;
}

@end