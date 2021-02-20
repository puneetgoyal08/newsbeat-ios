//
//  ViewController.m
//  newsbeat
//
//  Created by puneet.g on 15/02/21.
//

#import "ViewController.h"
#import "CommonMacros.h"
#import "SearchTableCell.h"
#import "NewsDataSource.h"
#import "NewsViewController.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface ViewController ()<UISearchBarDelegate, UITableViewDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *searchResult;
@property (nonatomic, strong) NewsDataSource * newsDataSource;

@end

@implementation ViewController
{
    NSMutableArray *tableDataArray;
    BOOL searchEnabled;
}

- (instancetype)init {
    if ((self = [super init])) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _newsDataSource = [[NewsDataSource alloc] initWithReuseID:@"reuseID"];
        
    }
    return self;
}

- (void)setupSearchBar {
//    self.searchBar.translucent = NO;
    [[UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setDefaultTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14.0]}];
    self.searchBar.barTintColor = [UIColor whiteColor];
    self.searchBar.layer.cornerRadius = 2;
    self.searchBar.layer.masksToBounds = YES;
    self.searchBar.delegate = self;
    self.tableView.rowHeight = 100;
//    self.initialSearchBarFrame = self.searchBar.frame;
}

- (void) registerNibs {
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchTableCell" bundle:nil] forCellReuseIdentifier:@"reuseID"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"News Beat";
    self.newsDataSource.presentingController = self;
    [self.newsDataSource loadData:@""];
    [self setupSearchBar];
    [self setupTableView];
    // Do any additional setup after loading the view.
}

- (void)setupTableView {
    [self registerNibs];
    self.tableView.dataSource = self.newsDataSource;
    self.tableView.delegate = self;
    self.tableView.allowsSelection = true;
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    [self.tableView reloadData];
}

#pragma mark - table view delegate methods


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(reload) object:nil];
    [self.newsDataSource performSelector:@selector(loadData:) withObject:searchText afterDelay:0.5];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetails" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     if([segue.identifier isEqualToString:@"showDetails"]){
         NewsViewController *controller = (NewsViewController *)segue.destinationViewController;
         [controller setNews:[self.newsDataSource getNewsAtRow:self.tableView.indexPathForSelectedRow.row]];
     }
 }

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if ([[self.searchBar text] length] == 0) {
        return [[NSAttributedString alloc] initWithString:@"Search above to read news"];
    } else {
        return [[NSAttributedString alloc] initWithString:@"No results found"];
    }
    
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if ([[self.searchBar text] length] == 0) {
        return NULL;
    } else {
        return [UIImage imageNamed:@"not-found"];
    }
    
}

@end
