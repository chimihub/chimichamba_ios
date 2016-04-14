#import "cprofile.h"
#import "cmain.h"
#import "vprofile.h"

@interface cprofile ()

@property(strong, nonatomic)vprofile *view;

@end

@implementation cprofile

@dynamic view;

+(void)open
{
    cprofile *controller = [[cprofile alloc] init];
    [[cmain singleton] pushViewController:controller animated:YES];
}

-(void)loadView
{
    self.view = [[vprofile alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)presentpicker:(UIImagePickerController*)picker
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:picker];
        self.popover = popover;
        [popover presentPopoverFromRect:CGRectMake(self.view.picture.bounds.size.width, self.view.bounds.size.height / 2, 1, 1) inView:self.view.picture permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }
    else
    {
        [self presentViewController:picker animated:YES completion:nil];
    }
}

#pragma mark public

-(void)back
{
    [[cmain singleton] popViewControllerAnimated:YES];
}

-(void)picturecamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentpicker:picker];
}

-(void)picturelibrary
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentpicker:picker];
}

#pragma mark -
#pragma mark picker del

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if(self.popover)
    {
        [self.popover dismissPopoverAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    [self.view updatepicture:image];
}

@end