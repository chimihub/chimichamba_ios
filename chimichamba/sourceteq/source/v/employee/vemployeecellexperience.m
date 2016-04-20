#import "vemployeecellexperience.h"
#import "memployeeitemexperience.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

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
    [title setFont:[UIFont regularsize:14]];
    [title setTextColor:[UIColor main]];
    [title setText:NSLocalizedString(@"employee_item_experience_title", nil)];
    
    UILabel *labelrookie = [[UILabel alloc] init];
    [labelrookie setBackgroundColor:[UIColor clearColor]];
    [labelrookie setUserInteractionEnabled:NO];
    [labelrookie setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelrookie setFont:[UIFont regularsize:18]];
    [labelrookie setText:NSLocalizedString(@"employee_item_experience_rookie", nil)];
    [labelrookie setTextColor:[UIColor main]];
    
    UILabel *labelamount = [[UILabel alloc] init];
    [labelamount setBackgroundColor:[UIColor clearColor]];
    [labelamount setUserInteractionEnabled:NO];
    [labelamount setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelamount setFont:[UIFont boldsize:20]];
    [labelamount setTextAlignment:NSTextAlignmentCenter];
    self.labelamount = labelamount;
    
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
    [slider addTarget:self action:@selector(actionslider:) forControlEvents:UIControlEventValueChanged];
    self.slider = slider;
    
    [self addSubview:labelamount];
    [self addSubview:labelrookie];
    [self addSubview:title];
    [self addSubview:rookie];
    [self addSubview:slider];
    
    NSDictionary *views = @{@"title":title, @"labelrookie":labelrookie, @"rookie":rookie, @"slider":slider, @"labelamount":labelamount};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelamount]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[rookie]-10-[labelrookie]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-52-[labelrookie(29)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-52-[rookie]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[slider]-30-|" options:0 metrics:metrics views:
                          views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-110-[labelamount(40)]-10-[slider]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionrookie:(UISwitch*)rookie
{
    self.model.rookie = rookie.isOn;
    [self checkrookie];
}

-(void)actionslider:(UISlider*)slider
{
    self.model.years = slider.value;
    [self printamount];
}

#pragma mark functionality

-(void)checkrookie
{
    if(self.model.rookie)
    {
        [self.slider setEnabled:NO];
        [self.slider setValue:minimumexperience animated:YES];
        [self.labelamount setTextColor:[UIColor colorWithWhite:0.6 alpha:1]];
        [self.labelamount setText:@""];
    }
    else
    {
        self.model.years = minimumexperience;
        [self.slider setEnabled:YES];
        [self.labelamount setTextColor:[UIColor main]];
        [self printamount];
    }
}

-(void)printamount
{
    NSString *stringamount;
    NSInteger amount = roundf(self.model.years);
    
    if(amount == maximumexperience)
    {
        stringamount = [NSString stringWithFormat:NSLocalizedString(@"employee_item_experience_master", nil), @(amount)];
    }
    else if(amount == 1)
    {
        stringamount = [NSString stringWithFormat:NSLocalizedString(@"employee_item_experience_amount_1", nil), @(amount)];
    }
    else
    {
        stringamount = [NSString stringWithFormat:NSLocalizedString(@"employee_item_experience_amount", nil), @(amount)];
    }
    
    [self.labelamount setText:stringamount];
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