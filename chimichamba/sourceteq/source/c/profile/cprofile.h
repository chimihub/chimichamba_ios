#import <UIKit/UIKit.h>
#import "cchimi.h"

@interface cprofile:cchimi<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

+(void)open;
-(void)back;
-(void)picturecamera;
-(void)picturelibrary;
-(void)next;

@property(weak, nonatomic)UIPopoverController *popover;

@end