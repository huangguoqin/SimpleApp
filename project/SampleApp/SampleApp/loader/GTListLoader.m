//
//  GTListLoader.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/11.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>

@implementation GTListLoader


-(void)loadListData{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index.php?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"success````");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure```");
        }];
    
//    NSURL *listURL = [NSURL URLWithString:urlString];
//    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
//    // initial session 初始化session
//    NSURLSession *session = [NSURLSession sharedSession];
//    // 将session封装成task
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest];
//
    NSLog(@"SDasdasd");
}

@end


