//
//  main.m
//  newsbeat
//
//  Created by puneet.g on 15/02/21.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
        return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
