#import <UIKit/UIKit.h>
#import "cemployeeskill.h"
#import "mskill.h"
#import "vemployeeskillsearch.h"

@interface vemployeeskill:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cemployeeskill*)controller;
-(void)scrolltop;

@property(weak, nonatomic)cemployeeskill *controller;
@property(weak, nonatomic)vemployeeskillsearch *search;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutcolbottom;
@property(strong, nonatomic)mskill *model;
@property(strong, nonatomic)NSMutableArray<mskillitem*> *results;
@property(nonatomic)BOOL searching;

@end