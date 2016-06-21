//
//  PayCenter.h
//  SimpleThirdPlatform
//
//  Created by ileo on 16/6/21.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlatformCenter.h"

typedef NS_ENUM(NSInteger, Share_Platform){
    Pay_WX = 1,
    Pay_Ali = 2,
};

@interface PayCenter : NSObject

@end
