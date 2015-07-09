//
//  Paging.m
//  Paging
//
//  Created by Mustafa Yusuf on 30.06.2015.
//  Copyright © 2015 Mustafa Yusuf. All rights reserved.
//

#import "AsyncPager.h"

@interface AsyncPager ()

@property (nonatomic) int offset;
@property (nonatomic) int limit;
@property (nonatomic) BOOL isLoading;

@end

@implementation AsyncPager

- (nonnull instancetype)initWithOffset:(int)offset andLimit:(int)limit {
    self = [super init];
    if (self) {
        self.offset = offset;
        self.limit = limit;
        self.isLoading = NO;
    }
    return self;
}

- (void)next:(nonnull AsyncPagerFetchBlock)fetchNext onFinish:(nullable AsyncPagerCompletionBlock)finish {
    if (self.isLoading) {
        return;
    }
    
    self.isLoading = YES;
    
    fetchNext(self.offset, self.limit, ^(NSArray *items){
        if (finish) {
            finish(items);
        }
        self.offset += (int)items.count;
        self.isLoading = NO;
    });
}

@end
