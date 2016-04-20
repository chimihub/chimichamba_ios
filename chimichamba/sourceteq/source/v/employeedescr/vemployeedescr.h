#import <UIKit/UIKit.h>
#import "cemployeedescr.h"
#import "vemployeedescraccessory.h"

@interface vemployeedescr:UIView

-(instancetype)init:(cemployeedescr*)controller;

@property(weak, nonatomic)cemployeedescr *controller;
@property(weak, nonatomic)vemployeedescraccessory *accessory;
@property(weak, nonatomic)UITextView *textview;
@property(weak, nonatomic)NSLayoutConstraint *layouttextbottom;

@end