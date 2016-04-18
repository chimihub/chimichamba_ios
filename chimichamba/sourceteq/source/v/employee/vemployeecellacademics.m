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
    
    UILabel *labeldegree = [[UILabel alloc] init];
    [labeldegree setBackgroundColor:[UIColor clearColor]];
    [labeldegree setUserInteractionEnabled:NO];
    [labeldegree setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeldegree setFont:[UIFont systemFontOfSize:16]];
    [labeldegree setTextColor:[UIColor main]];
    [labeldegree setText:NSLocalizedString(@"employee_inside_degree", nil)];
    
    [self addSubview:labeldegree];
    [self addSubview:icon];
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title, @"icon":icon, @"labeldegree":labeldegree};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(29)]-6-[labeldegree]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[icon(29)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[labeldegree(29)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionsegmented:(UISegmentedControl*)segmented
{
    self.model.selected = segmented.selectedSegmentIndex;
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
}

@end