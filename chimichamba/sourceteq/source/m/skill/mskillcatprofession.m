#import "mskillcatprofession.h"
#import "mskillitemdesigner.h"
#import "mskillitemdoctor.h"
#import "mskillitemprofessor.h"

@implementation mskillcatprofession

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mskillitemdesigner alloc] init],
                   [[mskillitemdoctor alloc] init],
                   [[mskillitemprofessor alloc] init]
                   ];
    
    return self;
}

@end