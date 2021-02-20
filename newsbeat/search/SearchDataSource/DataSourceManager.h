//
//  DataSourceDelegate.h
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//


#import <Foundation/Foundation.h>

@protocol DataSourceDelegate;

/**
 A class that adopts this protocol acts as the @p UITableViewDataSource and
 @p UITableViewDelegate for a Payees Table View.
 */

@protocol DataSourceManager <UITableViewDataSource>


@property (nonatomic, weak) id<DataSourceDelegate> delegate;

@optional
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
                                     reuseID:(NSString *)reuseID;

@end

@protocol DataSourceDelegate<NSObject>

@end

