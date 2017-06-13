//
//  NetworkManager.h
//  ReactiveCocoa
//
//  Created by changjian on 2017/6/13.
//  Copyright © 2017年 yz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ReactiveObjC.h"
#import "bookModel.h"

@interface NetworkManager : NSObject

+ (void)requestWithRACSubscriber:(id<RACSubscriber>)subscriber;

@end
