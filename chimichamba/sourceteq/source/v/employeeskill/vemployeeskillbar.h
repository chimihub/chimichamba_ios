#import <UIKit/UIKit.h>
#import "cemployeeskill.h"

@interface vemployeeskillbar:UIView

-(instancetype)init:(cemployeeskill*)controller;

@property(weak, nonatomic)cemployeeskill *controller;
@property(weak, nonatomic)UITextField *field;

@end