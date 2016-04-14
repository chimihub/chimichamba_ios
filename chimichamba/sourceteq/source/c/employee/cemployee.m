#import "cemployee.h"
#import "vemployee.h"

@interface cemployee ()

@property(weak, nonatomic)vemployee *view;

@end

@implementation cemployee

@dynamic view;

-(void)loadView
{
    self.view = [[vemployee alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end