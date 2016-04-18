#import "mskillcattrade.h"
#import "mskillitemcarpenter.h"
#import "mskillitemmecanic.h"
#import "mskillitemguard.h"
#import "mskillitemdriver.h"

@implementation mskillcattrade

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mskillitemcarpenter alloc] init],
                   [[mskillitemmecanic alloc] init],
                   [[mskillitemguard alloc] init],
                   [[mskillitemdriver alloc] init]
                   ];
    
    return self;
}

@end