#import "vemployeedescraccessory.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "uibutton+uibuttonmain.h"

static NSInteger const height = 40;

@implementation vemployeedescraccessory

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor background]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont regularsize:18]];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [label setTextAlignment:NSTextAlignmentRight];
    
    UIButton *button = [UIButton main:NSLocalizedString(@"employeedescr_button_save", nil)];
    [button addTarget:self action:@selector(actionsave:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(80)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[button]-2-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, height);
    
    return size;
}

#pragma mark actions

-(void)actionsave:(UIButton*)button
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

@end