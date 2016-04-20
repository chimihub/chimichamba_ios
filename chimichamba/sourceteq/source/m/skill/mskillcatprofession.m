#import "mskillcatprofession.h"
#import "mskillitemdesigner.h"
#import "mskillitemdoctor.h"
#import "mskillitemprofessor.h"
#import "mskillitemplumber.h"

@implementation mskillcatprofession

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"skill_cat_profession_name", nil);
    self.items = @[
                   [[mskillitemdesigner alloc] init],
                   [[mskillitemdoctor alloc] init],
                   [[mskillitemprofessor alloc] init]
                   ];
    [self sort];
    
    return self;
}

@end