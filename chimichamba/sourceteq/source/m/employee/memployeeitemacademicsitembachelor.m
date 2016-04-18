#import "memployeeitemacademicsitembachelor.h"

@implementation memployeeitemacademicsitembachelor

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"employee_item_academics_item_bachelor", nil);
    self.degreeable = YES;
    
    return self;
}

@end