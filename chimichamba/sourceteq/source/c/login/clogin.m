#import "clogin.h"
#import "vlogin.h"

@interface clogin ()

@property(strong, nonatomic)vlogin *view;

@end

@implementation clogin

@dynamic view;

-(void)loadView
{
    self.view = [[vlogin alloc] init:self];
}

@end