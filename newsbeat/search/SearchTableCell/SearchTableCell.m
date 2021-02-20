#import "SearchTableCell.h"
#import <Foundation/Foundation.h>
#import "News.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIFont+Additions.h"


@interface SearchTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end

@implementation SearchTableCell

- (void)awakeFromNib {
  [super awakeFromNib];
  [self setupView];
}

- (void)setNews:(News *)news withSearchText:(NSString *)searchText {
    self.titleLabel.text = news.title;
    [self setText:news.content forTextView:self.contentTextView withSearchText:searchText];
    [self.imageView sd_setImageWithURL:news.thumbnailUrl placeholderImage:[UIImage imageNamed:@"placeholder-news"]];
}

- (void)setupView {
    self.backgroundColor = [UIColor clearColor];
    [self.titleLabel setFont:[UIFont titleFont]];
    [self.contentTextView setFont:[UIFont subtitleFont]];
    [self.contentTextView.textContainer setLineFragmentPadding:0];
}

- (void) setText:(NSString *)srcTxt forTextView: (UITextView *)textView withSearchText:(NSString *)searchText {
        NSArray *list = [[searchText lowercaseString] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/;() "]];
        textView.text = srcTxt;
        NSMutableArray *rangesArray = [[NSMutableArray alloc] init];
        NSRange minRange = NSMakeRange(NSUIntegerMax, NSUIntegerMax);
        NSRange maxRange = NSMakeRange(0, 0);
        for (NSString *string in list) {
            NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/;() "]];
            if (trimmedString.length != 0) {
                NSRange range = [srcTxt rangeOfString:[NSString stringWithFormat:@"\\b%@\\b", trimmedString] options:NSRegularExpressionSearch|NSCaseInsensitiveSearch];
                if (range.location < minRange.location) {
                    minRange = range;
                }
                if (range.location > maxRange.location) {
                    maxRange = range;
                }
                [rangesArray addObject:[NSValue valueWithRange:range]];
                NSMutableAttributedString *tmpAttrTxt = [[NSMutableAttributedString alloc] initWithAttributedString:textView.attributedText];
                UIFont *boldFont = [UIFont fontWithName:@"ProximaNova-Bold" size:12];
                [tmpAttrTxt addAttribute:NSFontAttributeName
                                   value:boldFont range:range];
                textView.attributedText = tmpAttrTxt;
            }
        }
    [textView scrollRangeToVisible:minRange];
    [textView setUserInteractionEnabled:false];
}

@end
