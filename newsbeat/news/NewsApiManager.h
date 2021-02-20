//
//  NewsApiManager.h
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import "SessionManager.h"
#import "News.h"
#import "GetNewsRequest.h"
#import "GetNewsResponse.h"

@interface NewsApiManager : SessionManager

- (NSURLSessionDataTask *)getNewsWithModel:(GetNewsRequest *)requestModel success:(void (^)(GetNewsResponse *))success failure:(void (^)(NSError *))failure;

@end
