#import "vemployeeskillbar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"

static NSInteger const maxfieldmargin = 80;
static NSInteger const minfieldmargin = 20;

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
    self.buttonback = buttonback;
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont systemFontOfSize:16]];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setPlaceholder:NSLocalizedString(@"employeeskill_search_placeholder", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [field setTintColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    [field setDelegate:controller];
    self.field = field;
    
    UIView *background = [[UIView alloc] init];
    [background setClipsToBounds:YES];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setBackgroundColor:[UIColor whiteColor]];
    [background.layer setCornerRadius:6];
    [background addSubview:field];
    
    [self addSubview:buttonback];
    [self addSubview:background];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"back":background, @"field":field};
    NSDictionary *metrics = @{};
    
    self.layoutfieldleft = [NSLayoutConstraint constraintWithItem:field attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:maxfieldmargin];
    self.layoutfieldright = [NSLayoutConstraint constraintWithItem:field attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-maxfieldmargin];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonback(55)]-(-5)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[back(30)]-8-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutfieldleft];
    [self addConstraint:self.layoutfieldright];
    
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

#pragma mark public

-(void)expandfield
{
    self.layoutfieldleft.constant = minfieldmargin;
    self.layoutfieldright.constant = -minfieldmargin;
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self.buttonback setAlpha:0];
         [self layoutIfNeeded];
     }];
}

-(void)contractfield
{
    self.layoutfieldleft.constant = maxfieldmargin;
    self.layoutfieldright.constant = -maxfieldmargin;
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self.buttonback setAlpha:1];
         [self layoutIfNeeded];
     }];
}

@end