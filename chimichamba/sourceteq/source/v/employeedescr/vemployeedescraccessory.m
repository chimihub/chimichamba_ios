#import "vemployeedescraccessory.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "uibutton+uibuttonmain.h"

static NSInteger const height = 32;

@implementation vemployeedescraccessory

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor background]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setFont:[UIFont regularsize:17]];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [label setTextAlignment:NSTextAlignmentRight];
    self.label = label;
    
    UILabel *title = [[UILabel alloc] init];
    [title setFont:[UIFont regularsize:18]];
    [title setUserInteractionEnabled:NO];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextColor:[UIColor main]];
    [title setText:NSLocalizedString(@"employee_item_descr_title", nil)];
    
    UIButton *button = [UIButton main:NSLocalizedString(@"employeedescr_button_save", nil)];
    [button.layer setCornerRadius:0];
    [button addTarget:self action:@selector(actionsave:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:title];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-10-[button(100)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    
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

#pragma mark public

-(void)updatemax:(NSInteger)maxlength
{
    self.maxlength = maxlength;
    [self updatecharacters:0];
}

-(void)updatecharacters:(NSInteger)length
{
    NSString *stringlength = [NSString stringWithFormat:NSLocalizedString(@"employeedescr_label", nil), @(length), @(self.maxlength)];
    [self.label setText:stringlength];
}

@end