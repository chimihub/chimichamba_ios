#import <UIKit/UIKit.h>
#import "cemployee.h"

@interface vemployeebar:UIView

-(instancetype)init:(cemployee*)controller;

@property(weak, nonatomic)cemployee *controller;

@end