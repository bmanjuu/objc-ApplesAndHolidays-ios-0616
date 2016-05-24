//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self == 'apple'"];
    // use self when filtering through strings
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apples;
}



-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    //return an array of all the holiday keys in the submitted season argument
    
    NSArray *holidays = [database[season] allKeys];
    
    return holidays;
}



-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *supplies = database[season][holiday];
    
    return supplies;
}



-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    BOOL holidayInSeason = NO;
    
    NSArray *holidays = [self holidaysInSeason:season inDatabase:database];
    //call on previous method to obtain all holidays based on submitted season
    
    if([holidays containsObject:holiday]){
        holidayInSeason = YES; 
    }
    
    return holidayInSeason;
}



-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    BOOL suppliesPresent = NO;
    
    NSArray *supplies = database[season][holiday];
    
    if([supplies containsObject:supply]){
        suppliesPresent = YES;
    }
    
    return suppliesPresent;
}



-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    //adding new key value pair for holiday/supplies based on the submitted season argument
    
    NSMutableArray *emptyHolidayValues = [[NSMutableArray alloc] init];
    [database[season] setObject:emptyHolidayValues forKey:holiday];
    
    return database;
}



-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply];
    
    return database;
}

@end