#import <UIKit/UIKit.h>
#import "vchimi.h"

@interface vemployee:vchimi<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;

@end