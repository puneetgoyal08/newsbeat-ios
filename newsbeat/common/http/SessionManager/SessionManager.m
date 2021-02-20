//
//  SessionManager.m
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import <Foundation/Foundation.h>
#import "SessionManager.h"

static NSString *const kBaseURL = @"http://localhost:8089/news";

@implementation SessionManager

- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    if(!self) return nil;
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return self;
}

+ (id)sharedManager {
    static SessionManager *_sessionManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sessionManager = [[self alloc] init];
    });
    
    return _sessionManager;
}

@end
