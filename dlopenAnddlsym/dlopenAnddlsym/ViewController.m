//
//  ViewController.m
//  DynamicUpdateDemo
//
//  Created by demo on 2020/5/25.
//  Copyright © 2020 ls. All rights reserved.
//

/**
 Build Setting
 Runpath Search Path:链接路径
 @executable_path/Frameworks ： @executable_path 可执行文件 即打包后的app
 
 Build Phases
 Link Binary with Libraries 由required改为optional 可以需要时链接
 */

#import "ViewController.h"
#include <dlfcn.h>

//定义函数指针
typedef void (*LibFuncPointer)(void);


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSString *documentsPath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Frameworks/DynamicFramework.framework/DynamicFramework"] ofType:nil];
    [self dlopenLoadDylibWithPath:documentsPath];
}

- (void)dlopenLoadDylibWithPath:(NSString *)path
{
    void * libHandle = NULL;
    libHandle = dlopen([path cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
    if (libHandle == NULL) {
        char *error = dlerror();
        NSLog(@"dlopen error: %s", error);
    } else {
        NSLog(@"dlopen load framework success.");
        
         
         //OC函数
         Class cls = NSClassFromString(@"TestClass");
         SEL selector = NSSelectorFromString(@"test");
         [cls performSelector:selector];
         dlclose(libHandle);
         
        
        /*
        //C函数
        LibFuncPointer testFunc = dlsym(libHandle, "CFuncTest");
        testFunc();
        dlclose(libHandle);
         */
    }
}

@end
