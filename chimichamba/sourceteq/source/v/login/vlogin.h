#import <UIKit/UIKit.h>
#import "clogin.h"

@interface vlogin:UIView

-(instancetype)init:(clogin*)controller;

@property(weak, nonatomic)clogin *controller;
@property(weak, nonatomic)UIButton *buttonfacebook;
@property(weak, nonatomic)UIButton *buttonemail;

@end