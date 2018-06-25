//
//  SubClass.m
//  消息转发模拟多继承
//
//  Created by zhongding on 2018/6/25.
//

#import "SubClass.h"

#import <objc/runtime.h>

@interface SubClass()
//
@property(strong ,nonatomic) NSMutableDictionary *hashMap;

@end
@implementation SubClass

- (instancetype)init{
    if (self = [super init]) {
        _hashMap = [NSMutableDictionary new];
     
        [self registerMethodWithTarget:[OneBaseClass new]];
        [self registerMethodWithTarget:[TwoBaseClass new]];
    }
    return self;
}

- (void)registerMethodWithTarget:(id)target{
    
    //获取target的方法列表
    unsigned int count = 0;
    Method *methodList = class_copyMethodList([target class], &count);
    for (int i = 0; i < count; i++) {
        //保存方法名
        SEL sel = method_getName(methodList[i]);
        [_hashMap setObject:target forKey:NSStringFromSelector(sel)];
    }
    //必须释放
    free(methodList);
}

//该类只继承协议，没有实现方法，通过消息转发实现方法
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //获取方法名、target
    NSString *methodName = NSStringFromSelector(aSelector);
    id target = _hashMap[methodName];
    
    //target存在并相应方法
    if (target && [target respondsToSelector:aSelector]) {
        return [target methodSignatureForSelector:aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    //获取方法、target
    SEL sel = [anInvocation selector];
    id target = _hashMap[NSStringFromSelector(sel)];
    
    //target存在、并响应方法
    if (target && [target respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:target];
    }else{
        [super forwardInvocation:anInvocation];
    }
}

@end
