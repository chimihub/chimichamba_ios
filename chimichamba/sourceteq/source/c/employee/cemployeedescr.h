#import <UIKit/UIKit.h>
#import "memployeeitemdescr.h"

@interface cemployeedescr:UIViewController<UIGestureRecognizerDelegate, UITextViewDelegate>

-(instancetype)init:(memployeeitemdescr*)model;
-(void)back;

@property(weak, nonatomic)memployeeitemdescr *model;

@end