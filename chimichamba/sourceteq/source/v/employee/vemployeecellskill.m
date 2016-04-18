#import "vemployeecellskill.h"
#import "uicolor+uicolormain.h"

@implementation vemployeecellskill

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setFont:[UIFont systemFontOfSize:14]];
    [title setTextColor:[UIColor main]];
    [title setText:NSLocalizedString(@"employee_item_skills_title", nil)];
    
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    
    UIButton *button = [[UIButton alloc] init];
    [button addTarget:self action:@selector(actionedit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    return self;
}

#pragma mark actions

-(void)actionedit:(UIButton*)button
{
    
}

@end