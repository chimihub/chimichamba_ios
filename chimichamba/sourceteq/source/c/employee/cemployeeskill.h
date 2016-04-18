#import <UIKit/UIKit.h>
#import "memployeeitemskill.h"

@interface cemployeeskill:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(memployeeitemskill*)model;
-(void)back;

@property(weak, nonatomic)memployeeitemskill *model;

@end