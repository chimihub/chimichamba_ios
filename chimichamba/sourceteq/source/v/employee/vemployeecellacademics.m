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
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] init];
    [segmented setBackgroundColor:[UIColor whiteColor]];
    [segmented setTintColor:[UIColor main]];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.segmented = segmented;
    
    [self addSubview:segmented];
    
    NSDictionary *views = @{@"segmented":segmented};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[segmented]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[segmented]-50-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark employee cell



@end