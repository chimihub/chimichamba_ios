#import <UIKit/UIKit.h>
#import "vchimi.h"
#import "memployee.h"

@interface vemployee:vchimi<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)memployee *model;
@property(weak, nonatomic)UICollectionView *collection;

@end