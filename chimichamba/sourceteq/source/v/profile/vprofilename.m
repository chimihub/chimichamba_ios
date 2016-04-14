#import "vprofilename.h"

@implementation vprofilename

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *bordertop = [[UIView alloc] init];
    UIView *borderbottom = [[UIView alloc] init];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setFont:[UIFont systemFontOfSize:22]];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setPlaceholder:NSLocalizedString(@"profile_name_placeholder", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.field = field;
    
    [self addSubview:field];
    
    NSDictionary *views = @{@"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[field]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end