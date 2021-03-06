#import "cemployeeskill.h"
#import "vemployeeskill.h"
#import "tools.h"

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

#pragma mark functionality

-(void)performsearch:(NSString*)string
{
    __weak typeof(self) welf = self;
    NSString *cleanstring = [tools softcleanlatin:string.lowercaseString];
    
    if(string.length)
    {
        NSMutableArray<mskillitem*> *results = [NSMutableArray array];
        NSArray<mskillitem*> *skills = self.view.model.allskills;
        
        for(mskillitem *skill in skills)
        {
            if([skill resultforquery:cleanstring])
            {
                [results addObject:skill];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           welf.view.results = results;
                           [welf.view.collection reloadData];
                       });
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           welf.view.results = nil;
                           [welf.view.collection reloadData];
                       });
    }
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
    __weak typeof(self) welf = self;
    NSString *newstring = [field.text stringByReplacingCharactersInRange:range withString:string];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf performsearch:newstring];
                   });
    
    return YES;
}

@end