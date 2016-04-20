#import "vemployeecellexperience.h"
#import "memployeeitemexperience.h"
#import "uicolor+uicolormain.h"

@interface vemployeecellexperience ()

@property(weak, nonatomic)memployeeitemexperience *model;

@end

@implementation vemployeecellexperience

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setFont:[UIFont systemFontOfSize:14]];
    [title setTextColor:[UIColor main]];
    [title setText:NSLocalizedString(@"employee_item_experience_title", nil)];
    
    UILabel *labelrookie = [[UILabel alloc] init];
    [labelrookie setBackgroundColor:[UIColor clearColor]];
    [labelrookie setUserInteractionEnabled:NO];
    [labelrookie setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelrookie setFont:[UIFont systemFontOfSize:18]];
    [labelrookie setText:NSLocalizedString(@"employee_item_experience_rookie", nil)];
    [labelrookie setTextColor:[UIColor main]];
    
    UISwitch *rookie = [[UISwitch alloc] init];
    [rookie setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rookie setOnTintColor:[UIColor main]];
    [rookie addTarget:self action:@selector(actionrookie:) forControlEvents:UIControlEventValueChanged];
    self.rookie = rookie;
    
    [self addSubview:labelrookie];
    [self addSubview:title];
    [self addSubview:rookie];
    
    NSDictionary *views = @{@"title":title, @"labelrookie":labelrookie, @"rookie":rookie};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-14-[rookie]-10-[labelrookie]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[labelrookie(29)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[rookie]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionrookie:(UISwitch*)rookie
{
    
}

#pragma mark -
#pragma mark employee cell

-(void)config:(memployeeitemexperience*)model
{
    self.model = model;
    
}

@end