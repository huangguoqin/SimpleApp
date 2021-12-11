//
//  GTListLoader.h
//  SampleApp
//
//  Created by 黄某某 on 2021/12/11.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 定义个block，（在.h文件中）GTListItem不要用引入头文件的方式，等使用时再通过头文件引入
 */
@class GTListItem;

typedef void(^GTListLoaderFinishBlock)(BOOL success, NSArray<GTListItem *> *dataArray);

@interface GTListLoader : NSObject

/**
 暴露方法供外界调用，调用时需要按GTListLoaderFinishBlock格式传入参数
 */
-(void) loadListDataWithFinishBlock:(GTListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
