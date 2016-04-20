#import <Foundation/Foundation.h>

@interface mskillitem:NSObject

-(instancetype)init:(NSString*)name;
-(BOOL)equalsskill:(mskillitem*)skill;
-(BOOL)resultforquery:(NSString*)query;

@property(copy, nonatomic)NSString *name;
@property(copy, nonatomic)NSString *comparename;

@end