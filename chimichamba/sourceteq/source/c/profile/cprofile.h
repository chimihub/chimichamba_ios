#import <UIKit/UIKit.h>

@interface cprofile:UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate>

+(void)open;
-(void)back;
-(void)picturecamera;
-(void)picturelibrary;
-(void)next;

@property(weak, nonatomic)UIPopoverController *popover;

@end