#import "memployee.h"
#import "memployeeitemacademics.h"
#import "memployeeitemskill.h"
#import "memployeeitemexperience.h"
#import "memployeeitemdescr.h"
#import "memployeeitemlocation.h"

@implementation memployee

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[memployeeitemskill alloc] init],
                   [[memployeeitemacademics alloc] init],
                   [[memployeeitemexperience alloc] init],
                   [[memployeeitemdescr alloc] init],
                   [[memployeeitemlocation alloc] init]
                   ];
    
    return self;
}

@end