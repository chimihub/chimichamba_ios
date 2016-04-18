#import "mskillcat.h"

@implementation mskillcat

#pragma mark public

-(void)sort
{
    self.items = [self.items sortedArrayUsingComparator:
                  ^NSComparisonResult(mskillitem *obj1, mskillitem *obj2)
    {
        return [obj1.name compare:obj2.name];
    }];
}

@end