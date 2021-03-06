#import "cemployee.h"
#import "vemployee.h"
#import "cemployeeskill.h"
#import "cemployeedescr.h"

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
    
    if(firsttime)
    {
        firsttime = NO;
    }
    else
    {
        [self.view.collection reloadData];
    }
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

-(void)descr:(memployeeitemdescr*)model
{
    cemployeedescr *controller = [[cemployeedescr alloc] init:model];
    [self.navigationController pushViewController:controller animated:YES];
}

@end