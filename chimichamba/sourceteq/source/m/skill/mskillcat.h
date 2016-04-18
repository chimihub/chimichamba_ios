#import <Foundation/Foundation.h>
#import "mskillitem.h"

@interface mskillcat:NSObject

@property(strong, nonatomic)NSArray<mskillitem*> *items;
@property(copy, nonatomic)NSString *name;

@end