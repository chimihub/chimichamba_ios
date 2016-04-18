#import <UIKit/UIKit.h>
#import "memployeeitem.h"

@interface vemployeecell:UICollectionViewCell

-(void)config:(memployeeitem*)model;

@property(weak, nonatomic)memployeeitem *model;

@end