#import "vemployeecelldescr.h"
#import "uicolor+uicolormain.h"
#import "uifont+uifontmain.h"

@implementation vemployeecelldescr

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setFont:[UIFont systemFontOfSize:18]];
    [title setText:NSLocalizedString(@"employee_item_descr_title", nil)];
    self.title = title;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setContentMode:UIViewContentModeCenter];
    [icon setClipsToBounds:YES];
    [icon setImage:[UIImage imageNamed:@"profile_me"]];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *edit = [[UIImageView alloc] init];
    [edit setContentMode:UIViewContentModeCenter];
    [edit setClipsToBounds:YES];
    [edit setImage:[UIImage imageNamed:@"employee_edit"]];
    [edit setUserInteractionEnabled:NO];
    [edit setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:title];
    [self addSubview:edit];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon, @"title":title, @"edit":edit};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[icon(32)]-5-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[edit(32)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[edit]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setBackgroundColor:[UIColor main]];
        [self.title setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:self.colorbackground];
        [self.title setTextColor:[UIColor main]];
    }
}

#pragma mark -
#pragma mark employee cell

-(void)config:(memployeeitem*)model
{
    self.model = model;
    [self hover];
}

@end