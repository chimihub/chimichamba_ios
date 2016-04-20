#import "cemployeeskill.h"
#import "vemployeeskill.h"

@interface cemployeeskill ()

@property(strong, nonatomic)vemployeeskill *view;

@end

@implementation cemployeeskill

@dynamic view;

-(instancetype)init:(memployeeitemskill*)model
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
    self.view = [[vemployeeskill alloc] init:self];
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

#pragma mark -
#pragma mark field del

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField*)field
{
    [self.view scrolltop];
    [self.view.bar expandfield];
}

-(void)textFieldDidEndEditing:(UITextField*)field
{
    [self.view.bar contractfield];
}

-(BOOL)textField:(UITextField*)field shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
    [self.view scrolltop];
    
    NSString *newstring = [field.text stringByReplacingCharactersInRange:range withString:string];
    
    return YES;
}

@end