#import "vchimi.h"
#import "vprofilepicture.h"
#import "vprofilename.h"

@interface vprofile:vchimi

-(void)updatepicture:(UIImage*)image;

@property(weak, nonatomic)vprofilepicture *picture;
@property(weak, nonatomic)vprofilename *name;

@end