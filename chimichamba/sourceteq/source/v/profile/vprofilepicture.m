#import "vprofilepicture.h"
#import "uicolor+uicolormain.h"

static NSInteger const circlemargin = 5;

@implementation vprofilepicture

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *circle = [[UIView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle setClipsToBounds:YES];
    [circle setBackgroundColor:[UIColor background]];
    [circle.layer setBorderWidth:1];
    [circle.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.5].CGColor];
    self.circle = circle;
    
    UIImageView *placeholder = [[UIImageView alloc] init];
    [placeholder setClipsToBounds:YES];
    [placeholder setUserInteractionEnabled:NO];
    [placeholder setTranslatesAutoresizingMaskIntoConstraints:NO];
    [placeholder setContentMode:UIViewContentModeCenter];
    [placeholder setImage:[UIImage imageNamed:@"profile_picplaceholder"]];
    
    UIButton *buttonupload = [[UIButton alloc] init];
    [buttonupload setClipsToBounds:YES];
    [buttonupload setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonupload setImage:[UIImage imageNamed:@"profile_picupload"] forState:UIControlStateNormal];
    [buttonupload.imageView setContentMode:UIViewContentModeCenter];
    [buttonupload.imageView setClipsToBounds:YES];
    self.buttonupload = buttonupload;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    self.image = image;
    
    [circle addSubview:placeholder];
    [circle addSubview:image];
    [self addSubview:circle];
    [self addSubview:buttonupload];
    
    NSDictionary *views = @{@"circle":circle, @"placeholder":placeholder, @"buttonupload":buttonupload, @"image":image};
    NSDictionary *metrics = @{@"circlemargin":@(circlemargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(circlemargin)-[circle]-(circlemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(circlemargin)-[circle]-(circlemargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonupload(50)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonupload(50)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[placeholder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[placeholder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    __weak typeof(self) welf = self;
    CGFloat width = welf.bounds.size.width;
    CGFloat remain = width - (circlemargin * 2);
    CGFloat radius = remain / 2.0;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       welf.circle.layer.cornerRadius = radius;
                   });
    
    [super layoutSubviews];
}

@end