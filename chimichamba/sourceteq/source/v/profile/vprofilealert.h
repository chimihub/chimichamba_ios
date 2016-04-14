#import <UIKit/UIKit.h>
#import "cprofile.h"

@interface vprofilealert:UIView

-(instancetype)init:(cprofile*)controller;

@property(weak, nonatomic)cprofile *controller;

@end