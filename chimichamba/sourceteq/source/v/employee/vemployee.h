#import <UIKit/UIKit.h>
#import "cemployee.h"
#import "memployee.h"

@interface vemployee:UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cemployee*)controller;

@property(weak, nonatomic)cemployee *controller;
@property(strong, nonatomic)memployee *model;
@property(weak, nonatomic)UICollectionView *collection;

@end