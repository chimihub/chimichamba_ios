#import "cchimi.h"

@implementation cchimi

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.prevgesturedelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self.prevgesturedelegate;
}

@end