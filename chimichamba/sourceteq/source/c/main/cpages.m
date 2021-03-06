#import "cpages.h"
#import "clanding.h"
#import "clogin.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.statusbarstyle = UIStatusBarStyleDefault;
    [self pagelanding];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusbarstyle;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

-(void)pagelanding
{
    clanding *controller = [[clanding alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:NO];
}

#pragma mark public

-(void)pagelogin
{
    clogin *controller = [[clogin alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:YES];
}

@end