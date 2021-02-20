//
//  SessionManager.h
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import "AFHTTPSessionManager.h"

@interface SessionManager : AFHTTPSessionManager

+ (id)sharedManager;

@end
