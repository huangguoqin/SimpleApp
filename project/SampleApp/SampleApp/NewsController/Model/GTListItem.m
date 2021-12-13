//
//  GTListItem.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/11.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.authorName = [aDecoder decodeObjectForKey:@"authorName"];
        self.articleUrl = [aDecoder decodeObjectForKey:@"articleUrl"];
        self.picUrl = [aDecoder decodeObjectForKey:@"picUrl"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.authorName forKey:@"authorName"];
    [aCoder encodeObject:self.articleUrl forKey:@"articleUrl"];
    [aCoder encodeObject:self.picUrl forKey:@"picUrl"];
}

+ (BOOL) supportsSecureCoding{
    return YES;
}
#pragma mark - public method


-(void)configWithDictionary:(NSDictionary *) dictionary{
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.category = [dictionary objectForKey:@"category"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
}



@end
