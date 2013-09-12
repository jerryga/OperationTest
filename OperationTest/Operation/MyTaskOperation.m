//
//  MyTaskOperation.m
//  OperationTest
//
//  Created by Static Ga on 13-9-12.
//  Copyright (c) 2013年 Static Ga. All rights reserved.
//

#import "MyTaskOperation.h"

@implementation MyTaskOperation

- (void)main {
    NSLog(@"MyTaskStart %d",self.missionID);
    [NSThread sleepForTimeInterval:10];
    NSLog(@"MyTaskFinished %d",self.missionID);
}
@end
