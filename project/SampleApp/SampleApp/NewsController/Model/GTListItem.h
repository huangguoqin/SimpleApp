//
//  GTListItem.h
//  SampleApp
//
//  Created by 黄某某 on 2021/12/11.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTListItem : NSObject<NSSecureCoding>

@property(nonatomic, strong, readwrite) NSString *title;
@property(nonatomic, strong, readwrite) NSString *date;
@property(nonatomic, strong, readwrite) NSString *category;
@property(nonatomic, strong, readwrite) NSString *authorName;
@property(nonatomic, strong, readwrite) NSString *articleUrl;
@property(nonatomic, strong, readwrite) NSString *picUrl;

-(void)configWithDictionary:(NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
