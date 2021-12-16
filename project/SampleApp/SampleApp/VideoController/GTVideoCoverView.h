//
//  GTVideoCoverView.h
//  SampleApp
//
//  Created by 黄某某 on 2021/12/16.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell

-(void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
