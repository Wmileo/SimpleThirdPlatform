//
//  ShareCenter.m
//  EasyShare
//
//  Created by ileo on 16/2/2.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import "ShareCenter.h"

@implementation ShareCenter

+(void)shareURL:(ShareURLModel *)model withPlatform:(Share_Platform)platform callback:(void (^)(BOOL))callback{
    
    id handle;
    
    switch (platform) {
            case Share_WX_Session:
            case Share_WX_Timeline:
            handle = [[PlatformCenter sharedInstance] handlerWithPlatform:Handle_WX];
            break;
            case Share_QQ:
            case Share_QZone:
            handle = [[PlatformCenter sharedInstance] handlerWithPlatform:Handle_QQ];
            break;
            
        default:
            break;
    }
    
    if (handle && [handle respondsToSelector:@selector(handlePlatforms)]) {
        if ([[handle handlePlatforms] containsObject:@(platform)]) {
            [handle shareURL:model withPlatform:platform callback:callback];
        }
    }else{
        NSLog(@"该平台未配置，请于PlatformCenter进行配置");
    }

}

@end

