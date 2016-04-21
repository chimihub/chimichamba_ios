#import "cemployeedescr.h"
#import "vemployeedescr.h"

static NSInteger const maxlength = 140;

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
    [self.view.textview becomeFirstResponder];
    [self.view.accessory updatemax:maxlength];
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

#pragma mark -
#pragma mark textview del

-(void)textViewDidEndEditing:(UITextView*)text
{
    [self back];
}

-(BOOL)textView:(UITextView*)text shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)string
{
    BOOL should = NO;
    
    NSString *newstring = [text.text stringByReplacingCharactersInRange:range withString:string];
    NSInteger newlength = newstring.length;
    
    if(newlength <= maxlength)
    {
        should = YES;
        [self.view.accessory updatecharacters:newlength];
    }
    
    return should;
}

@end