#import "vemployeecellexperience.h"
#import "memployeeitemexperience.h"
#import "uicolor+uicolormain.h"

static NSInteger const minimumexperience = 1;
static NSInteger const maximumexperience = 10;

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
    
    UISlider *slider = [[UISlider alloc] init];
    [slider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [slider setMinimumTrackTintColor:[UIColor main]];
    [slider setContinuous:YES];
    [slider setMinimumValue:minimumexperience];
    [slider setMaximumValue:maximumexperience];
    self.slider = slider;
    
    [self addSubview:labelrookie];
    [self addSubview:title];
    [self addSubview:rookie];
    
    NSDictionary *views = @{@"title":title, @"labelrookie":labelrookie, @"rookie":rookie, @"slider":slider};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[rookie]-10-[labelrookie]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-52-[labelrookie(29)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-52-[rookie]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[slider]-20-|" options:0 metrics:metrics views:
                          views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-80-[slider]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionrookie:(UISwitch*)rookie
{
    self.model.rookie = rookie.isOn;
    [self checkrookie];
}

#pragma mark functionality

-(void)checkrookie
{
    if(self.model.rookie)
    {
        
    }
    else
    {
        
    }
}

#pragma mark -
#pragma mark employee cell

-(void)config:(memployeeitemexperience*)model
{
    self.model = model;
    [self.rookie setOn:model.rookie];
    [self checkrookie];
}

@end