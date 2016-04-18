#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = [NSString stringWithFormat:
             @"CREATE TABLE skillcat "
             "(id INTEGER PRIMARY KEY, stationid TEXT COLLAGE NOCASE, latitude INTEGER, longitude INTEGER, altitude INTEGER, shortname TEXT COLLATE NOCASE, name TEXT COLLATE NOCASE, message TEXT);"];
    [dbcon query:query];
    
    [dbcon commit];
}



@end