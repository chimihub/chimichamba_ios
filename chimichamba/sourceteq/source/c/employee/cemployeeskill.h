#import <UIKit/UIKit.h>
#import "cchimi.h"
#import "memployeeitemskill.h"

@interface cemployeeskill:cchimi<UITextFieldDelegate>

-(instancetype)init:(memployeeitemskill*)model;
-(void)back;

@property(weak, nonatomic)memployeeitemskill *model;

@end