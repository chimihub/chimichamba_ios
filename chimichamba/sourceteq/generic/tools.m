#import "tools.h"

@implementation tools
{
    CFStringRef stringref;
}

+(instancetype)singleton
{
    static tools *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

+(void)rateapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", [properties valueForKey:@"appid"]]]];
}

+(NSDictionary*)defaultdict
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"defs" withExtension:@"plist"]];
    
    return dictionary;
}

+(NSInteger)timestamp
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    
    return now;
}

+(UIImage*)qrcode:(NSString*)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *ciimage = filter.outputImage;
    CIImage *scaleimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimage = [context createCGImage:scaleimage fromRect:scaleimage.extent];
    UIImage *uiimage = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
    CFRelease(cgimage);
    
    return uiimage;
}

+(NSString*)softcleanlatin:(NSString*)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@"á" withString:@"a"];
    str = [str stringByReplacingOccurrencesOfString:@"é" withString:@"e"];
    str = [str stringByReplacingOccurrencesOfString:@"í" withString:@"i"];
    str = [str stringByReplacingOccurrencesOfString:@"ó" withString:@"o"];
    str = [str stringByReplacingOccurrencesOfString:@"ú" withString:@"u"];
    str = [str stringByReplacingOccurrencesOfString:@"ü" withString:@"u"];
    
    return str;
}

#pragma mark -

-(instancetype)init
{
    self = [super init];
    
    stringref = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    
    return self;
}

#pragma mark public

-(NSString*)urlencode:(NSString*)string
{
    NSString *newstring = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)string, nil, stringref, kCFStringEncodingUTF8);
    
    return newstring;
}

@end