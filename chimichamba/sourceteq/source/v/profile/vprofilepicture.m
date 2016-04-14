#import "vprofilepicture.h"

@implementation vprofilepicture

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [self.layer setBorderWidth:1];
    [self.layer setBorderColor:[UIColor blackColor].CGColor];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat radius = width / 2.0;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       self.layer
                   });
    
    [super layoutSubviews];
}

@end