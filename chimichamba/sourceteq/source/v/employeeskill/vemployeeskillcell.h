#import <UIKit/UIKit.h>
#import "mskillitem.h"

@interface vemployeeskillcell:UICollectionViewCell

-(void)config:(mskillitem*)model;

@property(weak, nonatomic)UILabel *label;

@end