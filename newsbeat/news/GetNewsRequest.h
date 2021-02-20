//
//  GetNewsRequest.h
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface GetNewsRequest : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *query;

@end
