#import "cemployeedescr.h"
#import "vemployeedescr.h"

@interface cemployeedescr ()

@property(strong, nonatomic)vemployeedescr *view;

@end

@implementation cemployeedescr

@dynamic view;

-(instancetype)init:(memployeeitemdescr*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)loadView
{
    self.view = [[vemployeedescr alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end