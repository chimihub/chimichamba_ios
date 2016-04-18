#import "vemployee.h"
#import "cemployee.h"
#import "vemployeebar.h"
#import "vemployeecell.h"
#import "genericconstants.h"

static NSString* const employeecellid = @"employeecell";
static NSUInteger const interitemspace = 6;

@interface vemployee ()

@property(weak, nonatomic)cemployee *controller;

@end

@implementation vemployee

@dynamic controller;

-(instancetype)init:(cemployee*)controller
{
    self = [super init:controller];
    
    vemployeebar *bar = [[vemployeebar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumInteritemSpacing:interitemspace];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(interitemspace, 0, collectionbottom, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vemployeecell class] forCellWithReuseIdentifier:employeecellid];
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

@end