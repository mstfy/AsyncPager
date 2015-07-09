//
//  Paging.h
//  Paging
//
//  Created by Mustafa Yusuf on 30.06.2015.
//  Copyright © 2015 Mustafa Yusuf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^AsyncPagerCompletionBlock)(NSArray *__nonnull items);
typedef void(^AsyncPagerFetchBlock)(int offset, int limit, __nullable AsyncPagerCompletionBlock completion);

@interface AsyncPager : NSObject

@property (nonatomic, readonly) int offset;
@property (nonatomic, readonly) int limit;
@property (nonatomic, readonly) BOOL isLoading;

- (nonnull instancetype)initWithOffset:(int)offset andLimit:(int)limit;

- (void)next:(nonnull AsyncPagerFetchBlock)fetchNext onFinish:(nullable AsyncPagerCompletionBlock)finish;

@end
