#import <UIKit/UIKit.h>
#import "memployeeitem.h"
#import "memployeeitemacademicsitem.h"

@interface memployeeitemacademics:memployeeitem

-(NSArray<NSString*>*)names;
-(memployeeitemacademicsitem*)current;

@property(strong, nonatomic)NSArray<memployeeitemacademicsitem*> *items;
@property(nonatomic)NSUInteger selected;
@property(nonatomic)BOOL degree;

@end