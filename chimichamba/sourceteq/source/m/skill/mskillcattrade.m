#import "mskillcattrade.h"
#import "mskillitembabysitter.h"
#import "mskillitemcaretaker.h"
#import "mskillitemcarpenter.h"
#import "mskillitemdriver.h"
#import "mskillitemguard.h"
#import "mskillitemmecanic.h"
#import "mskillitemplumber.h"

@implementation mskillcattrade

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"skill_cat_trade_name", nil);
    self.items = @[
                   [[mskillitembabysitter alloc] init],
                   [[mskillitemcaretaker alloc] init],
                   [[mskillitemcarpenter alloc] init],
                   [[mskillitemmecanic alloc] init],
                   [[mskillitemguard alloc] init],
                   [[mskillitemdriver alloc] init],
                   [[mskillitemplumber alloc] init]
                   ];
    [self sort];
    
    return self;
}

@end