//
//  NSObject+Property.m
//  RunTime_02
//
//  Created by YJM on 2017/6/14.
//  Copyright © 2017年 YJM. All rights reserved.
//

#import "NSObject+Property.h"
#import <objc/message.h>
/*
 原理:给一个类声明属性,其实本质就是给这个类添加关联,并不是直接把这个值得内存空间添加到类的内存空间.
 
 需求:给系统NSObject类动态添加属性name字符串
 
 */



@implementation NSObject (Property)

- (void)setName:(NSString *)name{
    
    //objc_setAssociatedObject(将某个值跟某个对象关联起来,将某个值储存到某一个对象中)
    //object:给那个对象添加属性
    //key:属性名称
    //value:属性值
    //policy:保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name{
    return objc_getAssociatedObject(self, @"name");
}

/*
 总结:其实,给属性赋值的本质,就是让属性与一个对象产生关联,所以要给NSObject的分类的name属性赋值就是让name和NSObject产生关联,而runtime可以做到这一点
 */

@end
