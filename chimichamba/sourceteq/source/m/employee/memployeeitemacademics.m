#import "memployeeitemacademics.h"
#import "vemployeecellacademics.h"
#import "memployeeitemacademicsitemhighschool.h"
#import "memployeeitemacademicsitembachelor.h"
#import "memployeeitemacademicsitempostgraduate.h"
#import "memployeeitemacademicsitemother.h"

static NSUInteger const cellheight = 150;

@implementation memployeeitemacademics

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vemployeecellacademics class];
    self.height = cellheight;
    self.selected = 0;
    self.items = @[
                   [[memployeeitemacademicsitemhighschool alloc] init],
                   [[memployeeitemacademicsitembachelor alloc] init],
                   [[memployeeitemacademicsitempostgraduate alloc] init],
                   [[memployeeitemacademicsitemother alloc] init]
                   ];
    
    return self;
}

#pragma mark public

-(NSArray<NSString*>*)names
{
    NSMutableArray<NSString*> *names = [NSMutableArray array];
    NSUInteger count = self.items.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        memployeeitemacademicsitem *item = self.items[i];
        [names addObject:item.name];
    }
    
    return names;
}

@end