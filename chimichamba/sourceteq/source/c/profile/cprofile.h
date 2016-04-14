#import <UIKit/UIKit.h>

@interface cprofile:UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

+(void)open;
-(void)back;
-(void)uploadpicture;

@property(weak, nonatomic)UIPopoverController *popover;

@end