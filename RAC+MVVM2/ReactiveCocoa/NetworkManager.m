//
//  NetworkManager.m
//  ReactiveCocoa
//
//  Created by changjian on 2017/6/13.
//  Copyright © 2017年 yz. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (void)requestWithRACSubscriber:(id<RACSubscriber>)subscriber {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"q":@"帅哥"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功的时候调用
        //                NSLog(@"%@", responseObject);
        // 在这里就可以拿到数据，将其丢出去
        bookModel *model = [bookModel mj_objectWithKeyValues:responseObject];
        
        [subscriber sendNext:model];
        [subscriber sendCompleted]; // 一定要记得写
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
    
}
@end
