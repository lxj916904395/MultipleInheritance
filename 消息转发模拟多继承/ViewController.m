//
//  ViewController.m
//  消息转发模拟多继承
//
//  Created by zhongding on 2018/6/25.
//

#import "ViewController.h"
#import "SubClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    SubClass *sub = [SubClass new];
    [sub addOneBaseClass:@"zhangsan"];
    [sub addTwoBaseClass:@"lisi"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
