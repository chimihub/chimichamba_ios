#import "clogin.h"
#import "vlogin.h"
#import "cprofile.h"

@interface clogin ()

@property(strong, nonatomic)vlogin *view;

@end

@implementation clogin

@dynamic view;

-(void)loadView
{
    self.view = [[vlogin alloc] init:self];
}

#pragma mark public

-(void)profile
{
    [cprofile open];
}

@end