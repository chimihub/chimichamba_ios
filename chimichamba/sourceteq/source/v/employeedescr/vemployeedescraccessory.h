#import <UIKit/UIKit.h>

@interface vemployeedescraccessory:UIView

-(void)updatemax:(NSInteger)maxlength;
-(void)updatecharacters:(NSInteger)length;

@property(weak, nonatomic)UILabel *label;
@property(nonatomic)NSInteger maxlength;

@end