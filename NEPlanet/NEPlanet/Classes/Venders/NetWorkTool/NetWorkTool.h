//
//  NetWorkTool.h
//  GeekTime
//
//  Created by LuzhiChao on 2018/6/5.
//  Copyright © 2018年 LuzhiChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkTool : NSObject



/**
 GET

 @param URLString url
 @param parameters 参数
 @param ldDownloadProgress 下载进度
 @param ldSuccess 成功
 @param ldFailure 失败
 */
+ (void)GET:(NSString *)URLString parameters:(id)parameters downloadProgress:(void(^)(NSProgress *downloadProgress))ldDownloadProgress success:(void(^)(NSURLSessionDataTask *task, id responseObject))ldSuccess failure:(void(^)(NSURLSessionDataTask *task, NSError *error))ldFailure;


/**
 POST

 @param URLString url
 @param parameters 参数
 @param ldDownloadProgress 下载进度
 @param ldSuccess 成功
 @param ldFailure 失败
 */
+ (void)POST:(NSString *)URLString parameters:(id)parameters downloadProgress:(void(^)(NSProgress *downloadProgress))ldDownloadProgress success:(void(^)(NSURLSessionDataTask *task, id responseObject))ldSuccess failure:(void(^)(NSURLSessionDataTask *task, NSError *error, NSString *string))ldFailure;

@end
