//
//  PlatformCenter.m
//  SimpleThirdPlatform
//
//  Created by ileo on 16/6/21.
//  Copyright © 2016年 ileo. All rights reserved.
//

#import "PlatformCenter.h"

@interface PlatformCenter ()

@property (nonatomic, copy) NSDictionary *handlers;

@end


@implementation PlatformCenter

+(instancetype)sharedInstance{
    static id sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

- (id)copyWithZone:(NSZone*)zone{
    return self;
}

-(void)configPlatform:(Platform_Handle)platform handler:(id<PlatformHandle>)handler{
    NSMutableDictionary *tmp = [NSMutableDictionary dictionaryWithDictionary:self.handlers];
    [tmp setObject:handler forKey:[NSString stringWithFormat:@"%zd",platform]];
    self.handlers = [tmp copy];
}

-(BOOL)handleOpenURL:(NSURL *)url{
    __block BOOL isHandle = NO;
    
    [[self.handlers allValues] enumerateObjectsUsingBlock:^(id<PlatformHandle>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([url.absoluteString hasPrefix:[obj handleURLPrefix]]) {
            isHandle = [obj handleOpenURL:url];
            *stop = YES;
        }
    }];
    return isHandle;
}

-(id<PlatformHandle>)handlerWithPlatform:(Platform_Handle)platform{
    NSString *key = [NSString stringWithFormat:@"%zd",platform];
    return self.handlers[key];
}

@end
