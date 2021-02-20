//
//  SearchController.h
//  newsbeat
//
//  Created by puneet.g on 16/02/21.
//

#ifndef SearchController_h
#define SearchController_h

#import <UIKit/UIKit.h>

@interface SearchController : UITableViewController
{
    BOOL searching;
}

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSMutableArray *sampleDataArray;
@property (strong, nonatomic) NSMutableArray *filteredSampleDataArray;


- (IBAction)searchButtonClicked:(id)sender;


#endif /* SearchController_h */
