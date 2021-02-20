//
//  NewsViewController.m
//  newsbeat
//
//  Created by puneet.g on 18/02/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIFont+Additions.h"


@interface NewsViewController()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic) News *news;

@end

@implementation NewsViewController

- (void)setNews:(News *)news {
    _news = news;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self.titleLabel setText:self.news.title];
    [self.textView setText:self.news.content];
    if (self.news.coverUrl == NULL) {
        [self.imageViewHeightConstraint setConstant:0];
    }
    [self.coverImageView sd_setImageWithURL:self.news.coverUrl];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)setupView {
    [self.textView setFont:[UIFont subtitleFont]];
    [self.titleLabel setFont:[UIFont titleFont]];
}
@end
