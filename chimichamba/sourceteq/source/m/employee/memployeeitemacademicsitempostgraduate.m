#import "memployeeitemacademicsitempostgraduate.h"

@implementation memployeeitemacademicsitempostgraduate

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"employee_item_academics_item_postgraduate", nil);
    self.degreeable = YES;
    
    return self;
}

@end