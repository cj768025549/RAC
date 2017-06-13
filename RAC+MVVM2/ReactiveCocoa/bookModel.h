//
//  bookModel.h
//  ReactiveCocoa
//
//  Created by changjian on 2017/6/13.
//  Copyright © 2017年 yz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@class RatingItem;
@class ImageItem;

@interface bookModel : NSObject

@property (nonatomic, copy) NSArray *books;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger total;

@end

@interface bookItem : NSObject

@property (nonatomic, copy) NSString *alt;
@property (nonatomic, copy) NSString *alt_title;
@property (nonatomic, copy) NSArray *author;
@property (nonatomic, copy) NSString *author_intro;
@property (nonatomic, copy) NSString *binding;
@property (nonatomic, copy) NSString *catalog;
@property (nonatomic, copy) NSString *bookID;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) ImageItem *images;
@property (nonatomic, copy) NSString *isbn10;
@property (nonatomic, copy) NSString *isbn13;
@property (nonatomic, copy) NSString *origin_title;
@property (nonatomic, copy) NSString *pages;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *pubdate;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, strong) RatingItem *rating;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray *translator;
@property (nonatomic, copy) NSString *url;

@end

@interface TagItem : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;

@end

@interface RatingItem : NSObject

@property (nonatomic, assign) NSInteger average;
@property (nonatomic, assign) NSInteger max;
@property (nonatomic, assign) NSInteger min;
@property (nonatomic, assign) NSInteger numRaters;

@end

@interface ImageItem : NSObject

@property (nonatomic, copy) NSString *large;
@property (nonatomic, copy) NSString *medium;
@property (nonatomic, copy) NSString *small;

@end
