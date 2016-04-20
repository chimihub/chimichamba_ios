#import "vemployeedescraccessory.h"

static NSInteger const height = 80;

@implementation vemployeedescraccessory

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor redColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(UIViewNoIntrinsicMetric, height);
    
    return size;
}

@end