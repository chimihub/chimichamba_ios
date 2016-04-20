#import <UIKit/UIKit.h>
#import "memployeeitemskill.h"
#import "cemployeedescr.h"

@interface cemployee:UIViewController<UIGestureRecognizerDelegate>

-(void)back;
-(void)skills:(memployeeitemskill*)model;
-(void)descr:(memployeeitemdescr*)model;

@end