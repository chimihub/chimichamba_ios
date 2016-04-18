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
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] init];
    [segmented setBackgroundColor:[UIColor whiteColor]];
    [segmented setTintColor:[UIColor main]];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.segmented = segmented;
    
    [self addSubview:title];
    [self addSubview:segmented];
    
    NSDictionary *views = @{@"segmented":segmented, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[segmented]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[segmented]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark employee cell



@end