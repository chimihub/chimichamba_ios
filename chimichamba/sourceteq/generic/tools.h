#import <UIKit/UIKit.h>

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
+(UIImage*)qrcode:(NSString*)string;
+(NSString*)softcleanlatin:(NSString*)string;
-(NSString*)urlencode:(NSString*)string;

@end