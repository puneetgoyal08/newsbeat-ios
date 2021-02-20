//
//  NBImageProvider.m
//  newsbeat
//
//  Created by puneet.g on 19/02/21.
//

#import <Foundation/Foundation.h>

@implementation NBImageProvider

+ (void)fetchImageFromURL:(nullable NSURL *)URL
          completionBlock:(nonnull ZETANetworkImageProviderFetchCompletionBlock)completionBlock {
  if ([URL zeta_isZetaFileURL]) {
    UIImage *image = [UIImage imageNamed:[URL zeta_imageName]];
    if (completionBlock) {
      completionBlock(image);
    }
  } else {
    [[ZETANetworkImageProvider sharedProvider] fetchImageFromURL:URL
                                                 completionBlock:completionBlock];
  }
}
