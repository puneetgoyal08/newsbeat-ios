//
//  News.h
//  newsbeat
//
//  Created by puneet.g on 17/02/21.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface News : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSURL *thumbnailUrl;
@property (nonatomic, copy) NSURL *coverUrl;

@end
