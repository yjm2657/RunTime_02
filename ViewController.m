//
//  ViewController.m
//  RunTime_02
//
//  Created by YJM on 2017/6/13.
//  Copyright © 2017年 YJM. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"

#import "NSObject+Property.h"
#import "Person.h"

#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_geren"]];
    imageView.frame = CGRectMake(0, 0, 300, 200);
    [self.view addSubview:imageView];
    
    NSObject *objc = [[NSObject alloc]init];
    objc.name = @"1234";
    NSLog(@"runtime添加属性name==%@",objc.name);
    
#warning 分类中不能添加属性方法 编译时是针对声明,不会调用  而interface中只有声明的作用 所以编译的时候不会报错 而运行就会报错
//    objc.height = @"45";
    
/*
 如果一个类的方法非常多,加载类到内存的时候也比较耗费资源,需要每个方法生成映射表,可以使用动态给某个类,添加方法解决
 
 OC中我们很习惯的会用懒加载.当用到的时候才去加载它,但是实际上只要一个类实现了某个方法,就会被加载进内存.当我们不想加载这么多方法的时候,就会使用到runtime动态的添加方法
 */
    //runtime动态添加方法处理调用一个未实现的方法和去除报错
    Person *p = [[Person alloc]init];
    [p performSelector:@selector(run:) withObject:@10];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
