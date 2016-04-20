#import "vemployeeskill.h"
#import "vemployeeskillcell.h"
#import "uicolor+uicolormain.h"
#import "vemployeeskillheader.h"
#import "genericconstants.h"

static NSString* const skillheaderid = @"headerid";
static NSString* const skillcellid = @"skillcell";
static NSUInteger const interitemspace = 1;
static NSUInteger const cellheight = 60;
static NSUInteger const headerheight = 40;

@implementation vemployeeskill
{
    CGRect rectscroll;
}

-(instancetype)init:(cemployeeskill*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor background]];
    self.controller = controller;
    self.searching = NO;
    self.model = [[mskill alloc] init];
    rectscroll = CGRectMake(0, 0, 1, 1);
    
    vemployeeskillbar *bar = [[vemployeeskillbar alloc] init:controller];
    self.bar = bar;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumLineSpacing:0];
    [flow setMinimumLineSpacing:interitemspace];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vemployeeskillcell class] forCellWithReuseIdentifier:skillcellid];
    [collection registerClass:[vemployeeskillheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:skillheaderid];
    self.collection = collection;
    
    [self addSubview:bar];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"bar":bar, @"col":collection};
    NSDictionary *metrics = @{};
    
    self.layoutcolbottom = [NSLayoutConstraint constraintWithItem:collection attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutcolbottom];
    
    [self selectcurrent];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedkeyboardchange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedkeyboardchange:(NSNotification*)notification
{
    CGFloat ypos = 0;
    CGRect keyrect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat origin = keyrect.origin.y;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(origin < screenheight)
    {
        ypos = -(screenheight - origin);
    }
    
    self.layoutcolbottom.constant = ypos;
    
    [UIView animateWithDuration:1.5 animations:
     ^
     {
         [self layoutIfNeeded];
     }];
}

#pragma mark functionality

-(void)selectcurrent
{
    mskillitem *current = self.controller.model.skill;
    
    if(current)
    {
        NSIndexPath *indexpath;
        NSUInteger countsections = self.model.cats.count;
        
        for(NSUInteger i = 0; i < countsections; i++)
        {
            NSUInteger countitems = self.model.cats[i].items.count;
            
            for(NSUInteger j = 0; j < countitems; j++)
            {
                mskillitem *initem = self.model.cats[i].items[j];
                
                if([current equalsskill:initem])
                {
                    indexpath = [NSIndexPath indexPathForItem:j inSection:i + 1];
                    j = countitems;
                    i = countsections;
                }
            }
        }
        
        if(indexpath)
        {
            [self.collection selectItemAtIndexPath:indexpath animated:NO scrollPosition:UICollectionViewScrollPositionTop];
        }
    }
}

-(mskillitem*)modelforindex:(NSIndexPath*)index
{
    NSUInteger item = index.item;
    NSUInteger section = index.section;
    mskillitem *model;
    
    if(section)
    {
        model = self.model.cats[section - 1].items[item];
    }
    else
    {
        model = self.results[item];
    }
    
    return model;
}

#pragma mark public

-(void)scrolltop
{
    [self.collection scrollRectToVisible:rectscroll animated:YES];
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(section)
    {
        insets = UIEdgeInsetsMake(0, 0, collectionbottom, 0);
    }
    else
    {
        insets = UIEdgeInsetsZero;
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat height = 0;
    
    if(section)
    {
        if(!self.searching)
        {
            height = headerheight;
        }
    }
    
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger count = self.model.cats.count + 1;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = 0;
    
    if(self.searching)
    {
        if(!section)
        {
            count = self.results.count;
        }
    }
    else
    {
        if(section)
        {
            count = self.model.cats[section - 1].items.count;
        }
    }
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    NSUInteger section = index.section;
    vemployeeskillheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:skillheaderid forIndexPath:index];
    [header config:self.model.cats[section - 1]];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mskillitem *model = [self modelforindex:index];
    vemployeeskillcell *cell = [col dequeueReusableCellWithReuseIdentifier:skillcellid forIndexPath:index];

    [cell config:model];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mskillitem *model = [self modelforindex:index];
    self.controller.model.skill = model;
    [self.controller back];
}

@end