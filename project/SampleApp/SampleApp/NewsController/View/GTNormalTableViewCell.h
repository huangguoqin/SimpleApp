//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by 黄某某 on 2021/12/8.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

@interface GTNormalTableViewCell : UITableViewCell

-(void)layoutTableViewCellWithItem:(GTListItem *) item;

@end

NS_ASSUME_NONNULL_END
