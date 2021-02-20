//
//  SearchTableCell.h
//  newsbeat
//
//  Created by puneet.g on 16/02/21.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "News.h"

@interface SearchTableCell : UITableViewCell

- (void)setNews:(News *)news withSearchText:(NSString *)searchText;

@end
