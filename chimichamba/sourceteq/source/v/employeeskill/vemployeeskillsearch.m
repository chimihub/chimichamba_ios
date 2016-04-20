#import "vemployeeskillsearch.h"
#import "uicolor+uicolormain.h"

@implementation vemployeeskillsearch

-(instancetype)init:(cemployeeskill*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
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
    [self addSubview:background];
    
    NSDictionary *views = @{@"back":background, @"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[back]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[back(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end