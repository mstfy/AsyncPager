
### What is it?
AsyncPager is an objective-c micro library that helps pagination in tableviews and collection views. It tracks current page and calls your api to load next page so you don't need to keep track of that. It is inspired from [this](http://blog.krzyzanowskim.com/2015/06/26/paging/) blog post.

###How to install?
AsyncPager supports [Carthage](https://github.com/Carthage/Carthage). Just add the following line to your Cartfile

	github "mstfy/AsyncPager"

###How to use?
First create a property that holds instance of `AsyncPager` inside your view controller

	@property (nonatomic, strong) AsyncPager *pager;
Then initialize it inside `viewDidLoad`

	self.pager = [[AsyncPager alloc] initWithOffset:0 andLimit:25];
First parameter is the current page and the second one is item count per page.

Here is the important part. When you are loading items for next page from api wrap that with async pager.

	__weak typeof(self) weakSelf = self;
	[self.pager next:^(int offset, int limit, AsyncPagerCompletionBlock completion) {
		// Here is my api method that loads items
        [weakSelf loadItemsInRange:NSMakeRange(offset, limit) completion:^(NSArray *items, NSError *error) {
            completion(items);
        }];
    } onFinish:^(NSArray *items) {
        [weakSelf.items addObjectsFromArray:items];
        [weakSelf.tableView reloadData];
    }];
This is the only method that `AsyncPager` has. Inside `next` block you call your api method to load items. After you download your items call completion block. After you call completion block `AsyncPager` will call `onFinish' block with newly loaded items. Here you can update your ui with new items.

###License
AsyncPager is released under the MIT license. See LICENSE for details.