//
//  bookModel.m
//  ReactiveCocoa
//
//  Created by changjian on 2017/6/13.
//  Copyright © 2017年 yz. All rights reserved.
//

#import "bookModel.h"

@implementation bookModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"books":@"bookItem"};
}

@end


@implementation bookItem

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"bookID":@"id",
             @"imageUrl":@"image"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"tags":@"TagItem"};
}


@end


@implementation TagItem

@end


@implementation RatingItem

@end


@implementation ImageItem

@end
