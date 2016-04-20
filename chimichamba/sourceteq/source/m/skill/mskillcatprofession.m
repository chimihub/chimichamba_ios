#import "mskillcatprofession.h"
#import "mskillitemdesigner.h"
#import "mskillitemdoctor.h"
#import "mskillitemprofessor.h"
#import "mskillitempersonalassistant.h"

@implementation mskillcatprofession

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"skill_cat_profession_name", nil);
    self.items = @[
                   [[mskillitemdesigner alloc] init],
                   [[mskillitemdoctor alloc] init],
                   [[mskillitemprofessor alloc] init],
                   [[mskillitempersonalassistant alloc] init]
                   ];
    [self sort];
    
    return self;
}

@end