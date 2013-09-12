//
//  GGTestTool.m
//  OperationTest
//
//  Created by Static Ga on 13-9-12.
//  Copyright (c) 2013年 Static Ga. All rights reserved.
//

#import "GGTestTool.h"
#import "MyTaskOperation.h"

//#define GCD
/*
 
 Note: In iOS 4 and later, operation queues use Grand Central Dispatch to execute operations
 
 */
@implementation GGTestTool
+ (void)testQueue {
#ifdef GCD
    /*
     2013-09-12 17:45:53.638 OperationTest[10977:c07] Application windows are expected to have a root view controller at the end of application launch
     2013-09-12 17:45:53.639 OperationTest[10977:1303] MyTaskStart 1
     2013-09-12 17:45:53.639 OperationTest[10977:4603] MyTaskStart 4
     2013-09-12 17:45:53.639 OperationTest[10977:1803] MyTaskStart 2
     2013-09-12 17:45:53.639 OperationTest[10977:4503] MyTaskStart 5
     2013-09-12 17:45:53.639 OperationTest[10977:1e03] MyTaskStart 3
     2013-09-12 17:45:53.643 OperationTest[10977:4703] MyTaskStart 6
     2013-09-12 17:45:53.645 OperationTest[10977:4803] MyTaskStart 7
     2013-09-12 17:46:03.643 OperationTest[10977:1303] MyTaskFinished 1
     2013-09-12 17:46:03.643 OperationTest[10977:4503] MyTaskFinished 5
     2013-09-12 17:46:03.643 OperationTest[10977:1803] MyTaskFinished 2
     2013-09-12 17:46:03.643 OperationTest[10977:4703] MyTaskFinished 6
     2013-09-12 17:46:03.643 OperationTest[10977:4603] MyTaskFinished 4
     2013-09-12 17:46:03.643 OperationTest[10977:1e03] MyTaskFinished 3
     2013-09-12 17:46:03.647 OperationTest[10977:4803] MyTaskFinished 7
     
     */
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
    
    MyTaskOperation *task = [[MyTaskOperation alloc] init];
    task.missionID = 1;
    [queue addOperation:task];
    
    task = [[MyTaskOperation alloc] init];
    task.missionID = 2;
    [queue addOperation:task];
    
    task = [[MyTaskOperation alloc] init];
    task.missionID = 3;
    [queue addOperation:task];

    task = [[MyTaskOperation alloc] init];
    task.missionID = 4;
    [queue addOperation:task];
    
    task = [[MyTaskOperation alloc] init];
    task.missionID = 5;
    [queue addOperation:task];
    
    task = [[MyTaskOperation alloc] init];
    task.missionID = 6;
    [queue addOperation:task];
    
    task = [[MyTaskOperation alloc] init];
    task.missionID = 7;
    [queue addOperation:task];
   
#else
    /*
     2013-09-12 17:50:51.439 OperationTest[11050:3e13] MyTaskStart 4
     2013-09-12 17:50:51.439 OperationTest[11050:1e03] MyTaskStart 3
     2013-09-12 17:50:51.439 OperationTest[11050:c07] Application windows are expected to have a root view controller at the end of application launch
     2013-09-12 17:50:51.439 OperationTest[11050:1b03] MyTaskStart 2
     2013-09-12 17:50:51.439 OperationTest[11050:1303] MyTaskStart 1
     2013-09-12 17:50:51.446 OperationTest[11050:4403] MyTaskStart 5
     2013-09-12 17:50:51.446 OperationTest[11050:4603] MyTaskStart 6
     2013-09-12 17:50:51.446 OperationTest[11050:4703] MyTaskStart 7
     2013-09-12 17:51:01.443 OperationTest[11050:3e13] MyTaskFinished 4
     2013-09-12 17:51:01.443 OperationTest[11050:1303] MyTaskFinished 1
     2013-09-12 17:51:01.443 OperationTest[11050:1b03] MyTaskFinished 2
     2013-09-12 17:51:01.443 OperationTest[11050:1e03] MyTaskFinished 3
     2013-09-12 17:51:01.446 OperationTest[11050:4403] MyTaskFinished 5
     2013-09-12 17:51:01.447 OperationTest[11050:4703] MyTaskFinished 7
     2013-09-12 17:51:01.447 OperationTest[11050:4603] MyTaskFinished 6
     
     */
    dispatch_queue_t gcdQueue = dispatch_queue_create("com.gg.operationtest", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",1);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",1);

    });

    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",2);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",2);
        
    });

    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",3);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",3);
        
    });

    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",4);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",4);
        
    });

    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",5);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",5);
        
    });

    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",6);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",6);
        
    });

    dispatch_async(gcdQueue, ^{
        NSLog(@"MyTaskStart %d",7);
        [NSThread sleepForTimeInterval:10];
        NSLog(@"MyTaskFinished %d",7);
        
    });
#endif
}
@end
