#import <UIKit/UIKit.h>
#import "cchimi.h"
#import "memployeeitemdescr.h"

@interface cemployeedescr:UIViewController<UITextViewDelegate>

-(instancetype)init:(memployeeitemdescr*)model;
-(void)back;

@property(weak, nonatomic)memployeeitemdescr *model;

@end