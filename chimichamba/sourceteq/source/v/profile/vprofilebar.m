#import "vprofilebar.h"
#import "uicolor+uicolormain.h"

@implementation vprofilebar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor main]];
    
    return self;
}

@end