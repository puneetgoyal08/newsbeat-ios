//
//  GetNewsRequest.m
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import <Foundation/Foundation.h>
#import "GetNewsRequest.h"

@implementation GetNewsRequest

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:[self class]];
}

@end
