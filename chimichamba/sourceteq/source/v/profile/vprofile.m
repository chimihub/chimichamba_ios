#import "vprofile.h"
#import "vprofilebar.h"
#import "vprofilepicture.h"
#import "uicolor+uicolormain.h"
#import "uibutton+uibuttonmain.h"

static NSInteger const picturesize = 150;

@interface vprofile ()

@property(weak, nonatomic)cprofile *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutpictureleft;

@end

@implementation vprofile

@dynamic controller;

-(instancetype)init:(cprofile*)controller
{
    self = [super init:controller];
    
    vprofilebar *bar = [[vprofilebar alloc] init:controller];
    
    vprofilepicture *picture = [[vprofilepicture alloc] init];
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[@"Busco chamba", @"Quiero contratar"]];
    [segmented setClipsToBounds:YES];
    [segmented setTranslatesAutoresizingMaskIntoConstraints:NO];
    [segmented setSelectedSegmentIndex:0];
    [segmented setTintColor:[UIColor main]];
    [segmented setBackgroundColor:[UIColor whiteColor]];
    self.segmented = segmented;
    
    UIButton *buttoncontinue = [UIButton second:NSLocalizedString(@"profile_button_continue", nil)];
    
    [self addSubview:bar];
    [self addSubview:picture];
    [self addSubview:segmented];
    [self addSubview:buttoncontinue];
    
    NSDictionary *views = @{@"bar":bar, @"picture":picture, @"segmented":segmented, @"buttoncontinue":buttoncontinue};
    NSDictionary *metrics = @{@"picturesize":@(picturesize)};
    
    self.layoutpictureleft = [NSLayoutConstraint constraintWithItem:picture attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[picture(picturesize)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[segmented]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[buttoncontinue]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-20-[picture(picturesize)]-50-[segmented(40)]-40-[buttoncontinue]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutpictureleft];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat remain = width - picturesize;
    CGFloat margin = remain / 2.0;
    self.layoutpictureleft.constant = margin;
    
    [super layoutSubviews];
}

#pragma mark public

-(void)updatepicture:(UIImage*)image
{
}

@end