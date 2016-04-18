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
    
    return self;
}

@end