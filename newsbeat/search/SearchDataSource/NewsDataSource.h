//
//  NewsDataSource.h
//  newsbeat
//
//  Created by puneet.g on 16/02/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, weak) UITableViewController *presentingController;

- (instancetype)initWithReuseID:(NSString *) reuseID;
- (void)loadData:(NSString *)searchText;
- (News *)getNewsAtRow:(NSUInteger)row;

@end
