//
//  GetNewsResponse.m
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import <Foundation/Foundation.h>
#import "GetNewsResponse.h"

@class News;

@implementation GetNewsResponse

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:[self class]];
}

#pragma mark - JSON Transformer

+ (NSValueTransformer *)newsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:News.class];
}

@end
