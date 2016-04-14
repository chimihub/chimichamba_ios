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

#pragma mark public

-(void)back
{
    [[cmain singleton] popViewControllerAnimated:YES];
}

-(void)picturecamera
{
    
}

-(void)picturelibrary
{
    
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