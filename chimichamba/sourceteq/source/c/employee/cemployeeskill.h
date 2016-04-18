#import <UIKit/UIKit.h>
#import "memployeeitemskill.h"

@interface cemployeeskill:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(meployeeitemskill*)model;

@property(weak, nonatomic)meployeeitemskill *model;

@end