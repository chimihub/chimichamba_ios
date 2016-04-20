#import <UIKit/UIKit.h>
#import "cemployeeskill.h"
#import "mskill.h"

@interface vemployeeskill:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cemployeeskill*)controller;

@property(weak, nonatomic)cemployeeskill *controller;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutcolbottom;
@property(strong, nonatomic)mskill *model;
@property(strong, nonatomic)NSMutableArray<mskillitem*> *results;
@property(nonatomic)BOOL searching;

@end