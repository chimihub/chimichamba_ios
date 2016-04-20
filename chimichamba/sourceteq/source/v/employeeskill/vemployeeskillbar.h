#import <UIKit/UIKit.h>
#import "cemployeeskill.h"

@interface vemployeeskillbar:UIView

-(instancetype)init:(cemployeeskill*)controller;
-(void)expandfield;
-(void)contractfield;

@property(weak, nonatomic)cemployeeskill *controller;
@property(weak, nonatomic)UITextField *field;
@property(weak, nonatomic)UIButton *buttonback;
@property(weak, nonatomic)NSLayoutConstraint *layoutfieldleft;
@property(weak, nonatomic)NSLayoutConstraint *layoutfieldright;

@end