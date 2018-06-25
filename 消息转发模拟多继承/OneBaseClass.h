//
//  OneBaseClass.h
//  消息转发模拟多继承
//
//  Created by zhongding on 2018/6/25.
//

#import <Foundation/Foundation.h>

@protocol OneBaseClassProtocol
- (void)addOneBaseClass:(NSString *)string;
@end

@interface OneBaseClass : NSObject<OneBaseClassProtocol>

@end
