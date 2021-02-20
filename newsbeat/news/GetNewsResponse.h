//
//  GetNewsResponse.h
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>
#import "News.h"

@interface GetNewsResponse : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSArray *news;

@end
