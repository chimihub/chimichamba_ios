#import "mskillcattrade.h"
#import "mskillitemcarpenter.h"
#import "mskillitemmecanic.h"
#import "mskillitemguard.h"
#import "mskillitemdriver.h"

@implementation mskillcattrade

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"skill_cat_trade_name", nil);
    self.items = @[
                   [[mskillitemcarpenter alloc] init],
                   [[mskillitemmecanic alloc] init],
                   [[mskillitemguard alloc] init],
                   [[mskillitemdriver alloc] init]
                   ];
    [self sort];
    
    return self;
}

@end