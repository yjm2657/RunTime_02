//
//  UIImage+Image.m
//  RunTime_02
//
//  Created by YJM on 2017/6/14.
//  Copyright © 2017年 YJM. All rights reserved.
//

#import "UIImage+Image.h"

#import <objc/message.h>


@implementation UIImage (Image)
///load方法:类加载进内存的时候调用,只会调用一次   方法应先交换,再去调用
+ (void)load{
    //1.获取imageNamed方法地址
    //class_getClassMethod (获取某一个类的方法)
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    //2.获取自己写的y_imageNamedMethod方法地址
    Method y_imageNamedMethod = class_getClassMethod(self, @selector(y_imageNamed:));
    
    //3.交换方法地址,相当于交换实现方式:[method_exchangeImplementations交换两个方法的实现]
    method_exchangeImplementations(imageNamedMethod, y_imageNamedMethod);
}

+ (UIImage *)y_imageNamed:(NSString *)name{
    UIImage *image = [UIImage y_imageNamed:name];
    if (image) {
        NSLog(@"runtime添加额外功能--加载成功");
    }else{
        NSLog(@"runtime添加额外功能--加载失败");
    }
    return image;
}

/*
 不能再分类里面重写系统方法imageNamed,因为会把系统的功能给覆盖掉,而且分类中不能调用super
 所有第二部,我们要实现一个带有扩展功能的方法
 */


@end
