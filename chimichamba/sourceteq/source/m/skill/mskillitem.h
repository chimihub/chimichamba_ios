#import <Foundation/Foundation.h>

@interface mskillitem:NSObject

-(BOOL)equalsskill:(mskillitem*)skill;
-(BOOL)resultforquery:(NSString*)query;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *comparename;

@end