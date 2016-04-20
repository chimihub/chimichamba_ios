#import "mskillcat.h"

@implementation mskillcat

#pragma mark public

-(void)sort
{
    self.items = [self.items sortedArrayUsingComparator:
                  ^NSComparisonResult(mskillitem *obj1, mskillitem *obj2)
    {
        return [obj1.comparename compare:obj2.comparename];
    }];
}

@end