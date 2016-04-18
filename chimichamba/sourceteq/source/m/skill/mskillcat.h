#import <Foundation/Foundation.h>
#import "mskillitem.h"

@interface mskillcat:NSObject

-(void)sort;

@property(strong, nonatomic)NSArray<mskillitem*> *items;
@property(copy, nonatomic)NSString *name;

@end