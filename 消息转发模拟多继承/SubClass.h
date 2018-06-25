//
//  SubClass.h
//  消息转发模拟多继承
//
//  Created by zhongding on 2018/6/25.
//

#import <Foundation/Foundation.h>
#import "OneBaseClass.h"
#import "TwoBaseClass.h"
@interface SubClass : NSObject<TwoBaseClassProtocol,OneBaseClassProtocol>

@end
