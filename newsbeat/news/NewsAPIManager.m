//
//  NewsAPIManager.m
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import "NewsApiManager.h"
#import "Mantle.h"
#import "GetNewsRequest.h"
#import "GetNewsResponse.h"

static NSString *const kArticlesListPath = @"/news/search";
static NSString *const kApiKey = @"replace this with your own key";

@implementation NewsApiManager

- (NSURLSessionDataTask *)getNewsWithModel:(GetNewsRequest *)requestModel success:(void (^)(GetNewsResponse *))success failure:(void (^)(NSError *))failure {
    NSDictionary *parameters = [MTLJSONAdapter JSONDictionaryFromModel:requestModel error:nil];
    
    return [self GET:kArticlesListPath parameters:parameters headers:NULL progress:NULL success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *responseDictionary = (NSDictionary *)responseObject;
        
        NSError *error;
        GetNewsResponse *response = [MTLJSONAdapter modelOfClass:GetNewsResponse.class
                                                   fromJSONDictionary:responseDictionary error:&error];
        success(response);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(error);
    }];
}

@end
