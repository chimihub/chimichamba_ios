#import "vemployeedescr.h"
#import "uifont+uifontmain.h"
#import "nsnotification+nsnotificationmain.h"

static NSInteger const insetsleft = 10;
static NSInteger const insetsright = 10;
static NSInteger const insetstop = 10;
static NSInteger const insetsbottom = 10;

@implementation vemployeedescr

-(instancetype)init:(cemployeedescr*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    
    UITextView *textview = [[UITextView alloc] init];
    [textview setBackgroundColor:[UIColor clearColor]];
    [textview setClipsToBounds:YES];
    [textview setFont:[UIFont regularsize:24]];
    [textview setTintColor:[UIColor blackColor]];
    [textview setTextColor:[UIColor blackColor]];
    [textview setClipsToBounds:YES];
    [textview setDelegate:controller];
    [textview setTextContainerInset:UIEdgeInsetsMake(insetstop, insetsleft, insetsbottom, insetsright)];
    [textview setKeyboardType:UIKeyboardTypeAlphabet];
    [textview setReturnKeyType:UIReturnKeyDefault];
    [textview setSpellCheckingType:UITextSpellCheckingTypeNo];
    [textview setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textview setKeyboardAppearance:UIKeyboardAppearanceLight];
    [textview setKeyboardDismissMode:UIScrollViewKeyboardDismissModeNone];
    [textview setAutocapitalizationType:UITextAutocapitalizationTypeSentences];
    [textview setShowsHorizontalScrollIndicator:NO];
    [textview setShowsVerticalScrollIndicator:NO];
    [textview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [textview setScrollEnabled:NO];
    self.textview = textview;
    
    [self addSubview:textview];
    
    NSDictionary *views = @{@"text":textview};
    NSDictionary *metrics = @{};
    
    self.layouttextbottom = [NSLayoutConstraint constraintWithItem:textview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[text]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[text]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layouttextbottom];
    
    [NSNotification observe:self keyboardchange:@selector(notifiedkeyboardchange:)];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedkeyboardchange:(NSNotification*)notification
{
    CGFloat ypos = 0;
    CGRect keyrect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat origin = keyrect.origin.y;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(origin < screenheight)
    {
        ypos = -(screenheight - origin);
    }
    
    self.layouttextbottom.constant = ypos;
    
    [UIView animateWithDuration:1.5 animations:
     ^
     {
         [self layoutIfNeeded];
     }];
}

@end