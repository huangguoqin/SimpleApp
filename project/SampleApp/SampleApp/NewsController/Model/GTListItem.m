//
//  GTListItem.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/11.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem


-(void)configWithDictionary:(NSDictionary *) dictionary{
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.category = [dictionary objectForKey:@"category"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
}

@end
