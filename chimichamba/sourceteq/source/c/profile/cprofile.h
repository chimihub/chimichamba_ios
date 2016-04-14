#import <UIKit/UIKit.h>

@interface cprofile:UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

+(void)open;
-(void)back;

@property(weak, nonatomic)UIPopoverController *popover;

@end