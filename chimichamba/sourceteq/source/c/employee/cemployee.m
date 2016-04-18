#import "cemployee.h"
#import "vemployee.h"
#import "cemployeeskill.h"

@interface cemployee ()

@property(strong, nonatomic)vemployee *view;

@end

@implementation cemployee
{
    BOOL firsttime;
}

@dynamic view;

-(instancetype)init
{
    self = [super init];
    firsttime = YES;
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    if(firsttime)
    {
        firsttime = NO;
    }
    else
    {
        [self.view.collection reloadData];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

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

#pragma mark public

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)skills:(memployeeitemskill*)model
{
    cemployeeskill *controller = [[cemployeeskill alloc] init:model];
    [self.navigationController pushViewController:controller animated:YES];
}

@end