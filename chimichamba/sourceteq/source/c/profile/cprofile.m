#import "cprofile.h"
#import "cmain.h"

@implementation cprofile

+(void)open
{
    cprofile *controller = [[cprofile alloc] init];
    [[cmain singleton] presentViewController:controller animated:YES completion:nil];
}

@end