//
//  NSObject+Property.h
//  RunTime_02
//
//  Created by YJM on 2017/6/14.
//  Copyright © 2017年 YJM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Property)

//@porperty:只会生成get,set方法声明,不会生成实现,也不会生成下划线成员属性(分类中)

@property NSString *name;
@property NSString *height;

@end
