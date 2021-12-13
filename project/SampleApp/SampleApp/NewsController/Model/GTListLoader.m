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
    
    __weak typeof(self) weakSelf = self;
    // 将session封装成task
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __weak typeof(weakSelf) strongSelf = weakSelf;
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
        
        // 缓存数据
        [weakSelf _archiveListDataWithArray:listItemArray.copy];
        
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
//
-(void) _archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // 在cache目录下创建文件夹，起名为GTData；dataPath为目录地址
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    // 创建文件，起名为list
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    // 将服务器返回的数据进行格式化
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding: YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    // 从文件中读取数据
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    // 反序列化
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [GTListItem class], nil] fromData:readListData error:nil];
    
    
  
    
    
//    // 创建文件内容，格式编码为utf8
//    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
//    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
//
//
//    //文件内容追加操作
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    // 将offset调整到文件的末尾
//    [fileHandle seekToEndOfFile];
//    // 执行追加操作
//    [fileHandle writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    // 刷新文件
//    [fileHandle synchronizeFile];
//    // 释放文件
//    [fileHandle closeFile];
    
    
//    // 查询文件
//    BOOL fileExists = [fileManager fileExistsAtPath:listDataPath];
//
//    // 删除文件
//    if(fileExists){
//        [fileManager removeItemAtPath:listDataPath error:nil];
//    }
    
    NSLog(@"");
}
@end


