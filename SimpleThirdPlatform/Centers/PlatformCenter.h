//
//  PlatformCenter.h
//  SimpleThirdPlatform
//
//  Created by ileo on 16/6/21.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Platform_Handle){
    Handle_WX = 1,
    Handle_QQ = 2,
};

@protocol PlatformHandle <NSObject>
-(BOOL)handleOpenURL:(NSURL *)url;
-(NSString *)handleURLPrefix;
@end

@interface PlatformCenter : NSObject

//单例
+(instancetype)sharedInstance;

//配置各个平台handle
-(void)configPlatform:(Platform_Handle)platform handler:(id <PlatformHandle>)handler;

//appdelegate
-(BOOL)handleOpenURL:(NSURL *)url;

-(id <PlatformHandle>)handlerWithPlatform:(Platform_Handle)platform;

@end
