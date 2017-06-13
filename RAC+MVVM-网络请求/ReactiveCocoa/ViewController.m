//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by Mr.Wang on 16/4/19.
//  Copyright © 2016年 Mr.wang. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveObjC.h"
#import "RequestViewModel.h"

@interface ViewController ()
// 请求视图模型
@property(nonatomic, strong)RequestViewModel *requestVM;

@end

@implementation ViewController

- (RequestViewModel *)requestVM {
    if (!_requestVM) {
        _requestVM = [[RequestViewModel alloc] init];
    }
    return _requestVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // GET  https://api.douban.com/v2/book/search
    
    // 发送请求
   RACSignal *signal = [self.requestVM.requestCommand execute:nil];
    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
}

- (IBAction)clickButtonAction:(id)sender {
    RACSignal *requestSingal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"q":@"帅哥"} progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [responseObject writeToFile:@"/Users/wang/Desktop/plist/sg.plist" atomically:YES];
            // 请求成功的时候调用
            //                NSLog(@"%@", responseObject);
            // 在这里就可以拿到数据，将其丢出去
            NSArray *dictArr = responseObject[@"books"];
            // 便利books字典数组，将其映射为模型数组
            NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
                return [[NSObject alloc] init];
            }] array];
            
            [subscriber sendNext:modelArr];
            NSLog(@"请求结束");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
    
//    [requestSingal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"");
//    }];
//    
//    [requestSingal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"");
//    }];
//    
//    [requestSingal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"");
//    }];
    
    RACMulticastConnection *connection = [requestSingal multicast:[RACReplaySubject subject]];
    [connection connect];
    
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"");

    }];
    
    [connection.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"");

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

