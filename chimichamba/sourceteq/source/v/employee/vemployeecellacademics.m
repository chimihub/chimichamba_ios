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
    
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[title]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark funcitonality

-(void)addsegemented
{
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:self.model.items];
    [segmented setBackgroundColor:[UIColor whiteColor]];
    [segmented setTintColor:[UIColor main]];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    [segmented setTintColor:[UIColor main]];
    self.segmented = segmented;
    
    [self addSubview:segmented];
    
    NSDictionary *views = @{@"segmented":segmented};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[segmented]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[segmented]-60-|" options:0 metrics:metrics views:views]];
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
}

@end