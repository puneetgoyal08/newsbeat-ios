//
//  UIFont+Additions.m
//  newsbeat
//
//  Created by puneet.g on 20/02/21.
//

#import "UIFont+Additions.h"

@implementation UIFont (Additions)

+ (UIFont *)titleFont {
    return [UIFont fontWithName:@"ProximaNova-Bold" size:14];
}

+ (UIFont *)subtitleFont {
    return [UIFont fontWithName:@"ProximaNova-Regular" size:12];
}

+ (UIFont *)boldFont {
    return [UIFont fontWithName:@"ProximaNova-Bold" size:12];
}

@end
