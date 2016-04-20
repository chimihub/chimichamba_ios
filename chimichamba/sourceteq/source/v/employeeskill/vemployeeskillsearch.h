#import <UIKit/UIKit.h>
#import "cemployeeskill.h"

@interface vemployeeskillsearch:UIView

-(instancetype)init:(cemployeeskill*)controller;

@property(weak, nonatomic)cemployeeskill *controller;
@property(weak, nonatomic)UITextField *field;

@end