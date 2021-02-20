//
//  UIImage+Additions.m
//  newsbeat
//
//  Created by puneet.g on 19/02/21.
//

#import "UIImage+Additions.h"

@implementation UIImage (Additions)

- (void)nb_setImageFromURL:(NSURL *)URL placeholderImageName:(NSString *)placeholderImageName {
  if (placeholderImageName) {
    self.image = [UIImage imageNamed:placeholderImageName];
  } else {
    self.image = nil;
  }

  if (URL == nil) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [ZETAImageProvider fetchImageFromURL:URL
                       completionBlock:^(UIImage *__nonnull image) {
                         weakSelf.image = image;
                       }];
}

@end
