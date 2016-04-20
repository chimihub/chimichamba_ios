#import <UIKit/UIKit.h>
#import "cemployeeskill.h"

@interface vemployeeskillsearch:UICollectionReusableView

-(void)config:(cemployeeskill*)controller;

@property(weak, nonatomic)cemployeeskill *controller;
@property(weak, nonatomic)UITextField *field;

@end