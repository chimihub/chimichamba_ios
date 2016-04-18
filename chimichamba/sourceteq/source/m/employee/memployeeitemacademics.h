#import <UIKit/UIKit.h>
#import "memployeeitem.h"
#import "memployeeitemacademicsitem.h"

@interface memployeeitemacademics:memployeeitem

-(NSArray*)names;

@property(strong, nonatomic)NSArray<memployeeitemacademicsitem*> *items;

@end