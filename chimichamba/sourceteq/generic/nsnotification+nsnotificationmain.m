#import "nsnotification+nsnotificationmain.h"

static NSString* const notification_stationsloaded =       @"stationsloaded";

@implementation NSNotification (nsnotificationmain)

+(void)observe:(id)observer keyboardchange:(SEL)selector
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:UIKeyboardWillChangeFrameNotification object:nil];
}

@end