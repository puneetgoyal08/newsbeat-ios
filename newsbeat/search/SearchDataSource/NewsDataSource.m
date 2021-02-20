//
//  NewsDataSource.m
//  newsbeat
//
//  Created by puneet.g on 16/02/21.
//

#import <Foundation/Foundation.h>
#import "NewsDataSource.h"
#import "SearchTableCell.h"
#import "NewsApiManager.h"
#import "CommonMacros.h"

@interface NewsDataSource () <UITableViewDataSource>

@property (nonatomic) NSString *cellReuseID;
@property (nonatomic) GetNewsResponse *searchResults;
@property (nonatomic) NSString *searchText;

@end

@implementation NewsDataSource

- (instancetype)initWithReuseID:(NSString *) reuseID {
    self = [super init];
    if (self) {
      _cellReuseID = reuseID;
    }
    return self;
}

- (void)loadData:(NSString *)searchText {
    _searchText = searchText;
    GetNewsRequest *request = [GetNewsRequest new];
    request.query = searchText;
    weakify(self);
    [[NewsApiManager sharedManager] getNewsWithModel:request success:^(GetNewsResponse *newsResponse) {
        strongify(self);
        self.searchResults =newsResponse;
        [self.presentingController.tableView reloadData];
        NSLog(@"news response %@" ,newsResponse);
    } failure:^(NSError *error) {
        NSLog(@"error fetching news : %@", error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.news.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SearchTableCell *cell =
        [tableView dequeueReusableCellWithIdentifier:self.cellReuseID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setNews:[self.searchResults.news objectAtIndex:indexPath.row] withSearchText:self.searchText];
    return cell;
}

- (News *)getNewsAtRow:(NSUInteger)row {
    return [self.searchResults.news objectAtIndex:row];
}


@end
