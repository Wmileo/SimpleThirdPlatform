//
//  ShareCenter.h
//  EasyShare
//
//  Created by ileo on 16/2/2.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlatformCenter.h"
#import "ShareModel.h"


typedef NS_ENUM(NSInteger, Share_Platform){
    Share_WX_Session = 1,
    Share_WX_Timeline = 2,
    Share_QQ = 3,
    Share_QZone = 4,
};

@protocol ShareHandle <NSObject>
-(NSArray *)handlePlatforms;
-(void)shareURL:(ShareURLModel *)model withPlatform:(Share_Platform)platform callback:(void (^)(BOOL isSuccess))callback;
@end

@interface ShareCenter : NSObject

//分享url新闻
+(void)shareURL:(ShareURLModel *)model withPlatform:(Share_Platform)platform callback:(void (^)(BOOL isSuccess))callback;


@end
