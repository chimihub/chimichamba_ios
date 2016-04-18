#import <UIKit/UIKit.h>
#import "mskillcat.h"

@interface vemployeeskillheader:UICollectionReusableView

-(void)config:(mskillcat*)model;

@property(weak, nonatomic)UILabel *label;

@end