#import "mskill.h"
#import "mskillcatprofession.h"
#import "mskillcattrade.h"

@implementation mskill

-(instancetype)init
{
    self = [super init];
    self.cats = @[
                  [[mskillcatprofession alloc] init],
                  [[mskillcattrade alloc] init]
                  ];
    
    NSMutableArray *allskills = [NSMutableArray array];
    
    for(mskillcat *cat in self.cats)
    {
        [allskills addObjectsFromArray:cat.items];
    }
    
    self.allskills = allskills;
    
    return self;
}

@end