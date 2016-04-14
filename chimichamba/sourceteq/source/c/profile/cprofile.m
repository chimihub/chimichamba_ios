#import "cprofile.h"
#import "cmain.h"
#import "vprofile.h"

@implementation cprofile

+(void)open
{
    cprofile *controller = [[cprofile alloc] init];
    [[cmain singleton] pushViewController:controller animated:YES];
}

-(void)loadView
{
    self.view = [[vprofile alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)back
{
    [[cmain singleton] popViewControllerAnimated:YES];
}

@end