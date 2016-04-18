#import "vemployee.h"
#import "vemployeebar.h"
#import "vemployeecell.h"
#import "genericconstants.h"

static NSUInteger const interitemspace = 15;

@implementation vemployee

-(instancetype)init:(cemployee*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.model = [[memployee alloc] init];
    vemployeebar *bar = [[vemployeebar alloc] init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumLineSpacing:interitemspace];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(interitemspace, 0, interitemspace, 0)];

    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"generic_background"]]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    self.collection = collection;
    
    NSUInteger count = self.model.items.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        memployeeitem *item = self.model.items[i];
        NSString *identifier = [self identifieratindex:i];
        [collection registerClass:item.cellclass forCellWithReuseIdentifier:identifier];
    }
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(NSString*)identifieratindex:(NSUInteger)index
{
    NSString *identifier = NSStringFromClass([self.model.items[index] class]);
    
    return identifier;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGFloat height = self.model.items[index.item].height;
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    NSUInteger item = index.item;
    NSString *identifier = [self identifieratindex:item];
    memployeeitem *model = self.model.items[item];
    vemployeecell *cell = [col dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:index];
    [cell config:model];
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    return NO;
}

@end