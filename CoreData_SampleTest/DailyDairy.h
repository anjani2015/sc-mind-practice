//
//  DailyDairy.h
//  CoreData_SampleTest
//
//  Created by Mittal, Anjani (external - Temp Staff) on 5/22/15.
//  Copyright (c) 2015 Mittal, Anjani (external - Temp Staff). All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DailyDairy : NSManagedObject

@property (nonatomic, retain) NSString * activityDesc;
@property (nonatomic, retain) NSDate * activityOnDate;

@end
