#import <Foundation/Foundation.h>
#import "mskillcat.h"

@interface mskill:NSObject

-(NSArray<mskillitem*>*)allskills;

@property(strong, nonatomic)NSArray<mskillcat*> *cats;
@property(strong, nonatomic)NSArray<mskillitem*> *allskills;

@end