#import "vemployeeskill.h"
#import "vemployeeskillbar.h"

@implementation vemployeeskill

-(instancetype)init:(cemployeeskill*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.controller = controller;
    self.searching = NO;
    self.model = [[mskill alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark col del

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

@end