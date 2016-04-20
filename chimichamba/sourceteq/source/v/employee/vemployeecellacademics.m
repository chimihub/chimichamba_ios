#import "vemployeecellacademics.h"
#import "uicolor+uicolormain.h"
#import "memployeeitemacademics.h"

@interface vemployeecellacademics ()

@property(weak, nonatomic)memployeeitemacademics *model;

@end

@implementation vemployeecellacademics

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
    [title setText:NSLocalizedString(@"employee_item_academics_title", nil)];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [icon setImage:[UIImage imageNamed:@"employee_degree"]];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    self.icon = icon;
    
    UILabel *labeldegree = [[UILabel alloc] init];
    [labeldegree setBackgroundColor:[UIColor clearColor]];
    [labeldegree setUserInteractionEnabled:NO];
    [labeldegree setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeldegree setFont:[UIFont systemFontOfSize:18]];
    [labeldegree setTextAlignment:NSTextAlignmentRight];
    [labeldegree setText:NSLocalizedString(@"employee_item_academics_degree", nil)];
    self.labeldegree = labeldegree;
    
    UISwitch *degree = [[UISwitch alloc] init];
    [degree setTranslatesAutoresizingMaskIntoConstraints:NO];
    [degree setOnTintColor:[UIColor main]];
    [degree addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventValueChanged];
    self.degree = degree;
    
    [self addSubview:labeldegree];
    [self addSubview:icon];
    [self addSubview:title];
    [self addSubview:degree];
    
    NSDictionary *views = @{@"title":title, @"icon":icon, @"labeldegree":labeldegree, @"degree":degree};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(29)]-5-[labeldegree]-10-[degree]-14-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon(29)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeldegree(29)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[degree]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionsegmented:(UISegmentedControl*)segmented
{
    self.model.selected = segmented.selectedSegmentIndex;
    
    [self checkdegreeable];
}

-(void)actionswitch:(UISwitch*)degree
{
    self.model.degree = degree.isOn;
}

#pragma mark functionality

-(void)addsegemented
{
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:[self.model names]];
    [segmented setBackgroundColor:[UIColor whiteColor]];
    [segmented setTintColor:[UIColor main]];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    [segmented setTintColor:[UIColor main]];
    [segmented addTarget:self action:@selector(actionsegmented:) forControlEvents:UIControlEventValueChanged];
    self.segmented = segmented;
    
    [self addSubview:segmented];
    
    NSDictionary *views = @{@"segmented":segmented};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[segmented]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-46-[segmented(32)]" options:0 metrics:metrics views:views]];
}

-(void)checkdegreeable
{
    if([self.model current].degreeable)
    {
        [self.degree setEnabled:YES];
        [self.degree setAlpha:1];
        [self.icon setAlpha:1];
        [self.labeldegree setTextColor:[UIColor main]];
        [self.degree setOn:self.model.degree];
    }
    else
    {
        self.model.degree = NO;
        [self.degree setEnabled:NO];
        [self.degree setOn:NO];
        [self.degree setAlpha:0.4];
        [self.labeldegree setTextColor:[UIColor colorWithWhite:0.7 alpha:1]];
        [self.icon setAlpha:0.2];
    }
}

#pragma mark -
#pragma mark employee cell

-(void)config:(memployeeitemacademics*)model
{
    self.model = model;
    
    if(!self.segmented)
    {
        [self addsegemented];
    }
    
    [self.segmented setSelectedSegmentIndex:self.model.selected];
    [self checkdegreeable];
}

@end