#import <UIKit/UIKit.h>
#import "cprofile.h"

@interface vprofilebar:UIView

-(instancetype)init:(cprofile*)controller;

@property(weak, nonatomic)cprofile *controller;

@end