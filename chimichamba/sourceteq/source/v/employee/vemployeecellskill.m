#import "vemployeecellskill.h"
#import "uicolor+uicolormain.h"

@interface vemployeecellskill ()

@property(weak, nonatomic)memployeeitemskill *model;

@end

@implementation vemployeecellskill

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setFont:[UIFont systemFontOfSize:14]];
    [title setText:NSLocalizedString(@"employee_item_skill_title", nil)];
    self.title = title;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(actionedit:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:title];
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"title":title, @"button":button, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionedit:(UIButton*)button
{
    [self setBackgroundColor:[UIColor main]];
    [self.title setTextColor:[UIColor whiteColor]];
    [self.label setTextColor:[UIColor whiteColor]];
    [self.controller skills:self.model];
}

#pragma mark functionality

-(void)checkskill
{
    if(self.model.skill)
    {
        [self.label setText:self.model.skill.name];
        [self.label setFont:[UIFont boldSystemFontOfSize:20]];
        [self.label setTextColor:[UIColor main]];
    }
    else
    {
        [self.label setText:NSLocalizedString(@"employee_item_skill_noskill", nil)];
        [self.label setFont:[UIFont systemFontOfSize:16]];
        [self.label setTextColor:[UIColor second]];
    }
}

#pragma mark -
#pragma mark employee cell

-(void)config:(memployeeitemskill*)model
{
    self.model = model;
    [self checkskill];
    [self.title setTextColor:[UIColor main]];
    [self setBackgroundColor:self.colorbackground];
}

@end