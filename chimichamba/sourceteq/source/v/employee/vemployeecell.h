#import <UIKit/UIKit.h>
#import "memployeeitem.h"
#import "cemployee.h"

@interface vemployeecell:UICollectionViewCell

-(void)config:(memployeeitem*)model;

@property(weak, nonatomic)memployeeitem *model;
@property(weak, nonatomic)cemployee *controller;

@end