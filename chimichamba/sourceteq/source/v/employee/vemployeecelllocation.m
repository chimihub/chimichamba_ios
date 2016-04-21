#import "vemployeecelllocation.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"
#import "memployeeitemlocation.h"

@interface memployeeitemlocation ()

@property(weak, nonatomic)memployeeitemlocation *model;

@end

@implementation vemployeecelllocation

@dynamic model;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextColor:[UIColor main]];
    [title setFont:[UIFont regularsize:18]];
    [title setText:NSLocalizedString(@"employee_item_location_title", nil)];
    [title setTextAlignment:NSTextAlignmentRight];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setContentMode:UIViewContentModeCenter];
    [icon setClipsToBounds:YES];
    [icon setImage:[UIImage imageNamed:@"employee_location"]];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UISwitch *current = [[UISwitch alloc] init];
    [current setTranslatesAutoresizingMaskIntoConstraints:NO];
    [current setOnTintColor:[UIColor main]];
    [current addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:title];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon, @"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(32)]-5-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon(60)]" options:0 metrics:metrics views:views]];
//    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[current]-14-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionswitch:(UISwitch*)degree
{
//    self.model.degree = degree.isOn;
}

#pragma mark -
#pragma mark employee cell

-(void)config:(memployeeitemlocation*)model
{
    self.model = model;
}

@end