#import "vprofilebar.h"
#import "uicolor+uicolormain.h"
#import "genericconstants.h"

@implementation vprofilebar

-(instancetype)init:(cprofile*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor main]];
    self.controller = controller;
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(navbarintrinsicwidth, navbarheight);
    
    return size;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    
}

@end