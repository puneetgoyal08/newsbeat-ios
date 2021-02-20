//
//  CommonMacros.h
//  newsbeat
//
//  Created by puneet.g on 16/02/21.
//

#ifndef CommonMacros_h
#define CommonMacros_h

#define ZETARegisterNib(tableView, className, reuseID)                                          \
[tableView registerNib:[UINib nibWithNibName:NSStringFromClass([className class]) bundle:nil] \
forCellReuseIdentifier:reuseID];

#define weakify(var) __weak typeof(var) AHKWeak_##var = var;

#define strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = AHKWeak_##var; \
_Pragma("clang diagnostic pop")

#endif /* CommonMacros_h */
