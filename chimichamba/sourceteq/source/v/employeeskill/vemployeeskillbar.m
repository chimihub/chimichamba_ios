#import "vemployeeskillbar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"

@implementation vemployeeskillbar

-(instancetype)init:(cemployeeskill*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor main]];
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setClipsToBounds:YES];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"generic_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont systemFontOfSize:20]];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setPlaceholder:NSLocalizedString(@"employeeskill_search_placeholder", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    [field setDelegate:controller];
    self.field = field;
    
    UIView *background = [[UIView alloc] init];
    [background setClipsToBounds:YES];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setBackgroundColor:[UIColor whiteColor]];
    [background.layer setCornerRadius:6];
    [background.layer setBorderWidth:1];
    [background.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.1].CGColor];
    [background addSubview:field];
    
    [self addSubview:buttonback];
    [self addSubview:background];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"back":background, @"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonback(55)]-(-5)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[back]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[back(30)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(navbarintrinsicwidth, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end