//
//  GTListLoader.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/11.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader


-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock{
    NSString *urlString = @"http://v.juhe.cn/toutiao/index.php?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    
//    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"success````");
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"failure```");
//        }];
    NSLog(@"");
    NSURL *listURL = [NSURL URLWithString:urlString];
//    __unused NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    // initial session 初始化session
    NSURLSession *session = [NSURLSession sharedSession];
    // 将session封装成task
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
#warning 类型的检查
        NSArray *dataArray = [(NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"] objectForKey:@"data"];
        
        NSMutableArray *listItemArray = @[].mutableCopy;
        
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [[GTListItem alloc] init];
            [listItem configWithDictionary: info];
            [listItemArray addObject:listItem];
        }
        
        // 因为涉及刷新问题，启用线程，将整个block放到主线程
        
        // 将整个block放到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            // 在此处调用block
            if(finishBlock){
                finishBlock(error==nil, listItemArray.copy);
            }
        });
        
        
        NSLog(@"");
    }];

    [dataTask resume];
    NSLog(@"SDasdasd");
}

@end


