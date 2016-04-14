#import <UIKit/UIKit.h>

@interface cprofile:UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

+(void)open;
-(void)back;
-(void)picturecamera;
-(void)picturelibrary;

@property(weak, nonatomic)UIPopoverController *popover;

@end