//
//  Person.m
//  RunTime_02
//
//  Created by YJM on 2017/6/13.
//  Copyright © 2017年 YJM. All rights reserved.
//

#import "Person.h"

#import <objc/message.h>

@implementation Person

- (void)eat{
    NSLog(@"eat_person");
}

+ (void)eat{
    NSLog(@"eat_class");
}

- (void)sleepOfHour:(NSNumber *)hour{
    NSLog(@"sleep_person_%@",hour);
}

+ (void)sleepOfHour:(NSNumber *)hour{
    NSLog(@"sleep_class_%@",hour);
}

- (NSNumber *)eatEnough:(NSNumber *)breadCount{
    NSLog(@"breadCount_person_%@",breadCount);
    return @(1);
}

+ (NSNumber *)eatEnough:(NSNumber *)breadCount{
    NSLog(@"breadCount_class_%@",breadCount);
    return @(0);
}

// 没有返回值,1个参数
// void,(id,SEL)
void aaa(id self, SEL _cmd, NSNumber *meter) {
    NSLog(@"跑了%@米", meter);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == NSSelectorFromString(@"run:")) {
        class_addMethod(self, sel, (IMP)aaa, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
