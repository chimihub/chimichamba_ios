#import <UIKit/UIKit.h>
#import "cchimi.h"
#import "cemployeedescr.h"
#import "memployeeitemskill.h"

@interface cemployee:cchimi

-(void)back;
-(void)skills:(memployeeitemskill*)model;
-(void)descr:(memployeeitemdescr*)model;

@end