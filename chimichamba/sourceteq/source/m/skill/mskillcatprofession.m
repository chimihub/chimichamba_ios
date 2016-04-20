#import "mskillcatprofession.h"
#import "mskillitemaccountant.h"
#import "mskillitemdesigner.h"
#import "mskillitemdoctor.h"
#import "mskillitemlawyer.h"
#import "mskillitempersonalassistant.h"
#import "mskillitemprofessor.h"

@implementation mskillcatprofession

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"skill_cat_profession_name", nil);
    self.items = @[
                   [[mskillitemaccountant alloc] init],
                   [[mskillitemdesigner alloc] init],
                   [[mskillitemdoctor alloc] init],
                   [[mskillitemlawyer alloc] init],
                   [[mskillitempersonalassistant alloc] init],
                   [[mskillitemprofessor alloc] init]
                   ];
    [self sort];
    
    return self;
}

@end