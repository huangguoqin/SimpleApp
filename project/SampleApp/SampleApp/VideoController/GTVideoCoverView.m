//
//  GTVideoCoverView.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/16.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>
@interface GTVideoCoverView()

// 视频缩略图
@property(nonatomic, strong, readwrite) UIImageView *coverView;

// 播放按钮
@property(nonatomic, strong, readwrite) UIImageView *playButton;

// 视频播放url
@property(nonatomic, strong, readwrite) NSString *videoUrl;
    
@end

@implementation GTVideoCoverView

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            self.coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            self.coverView;
        })];
        [_coverView addSubview:({
            int imageW = 50;
            int imageH = 50;
            self.playButton = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-imageW)/2, (self.frame.size.height-imageH)/2, imageW, imageH)];
            
            
            
            UITapGestureRecognizer *tapGresture =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPay)];
            
            [self addGestureRecognizer: tapGresture];
            
            self.playButton;
        })];
    }
    return self;
}

#pragma mark public method
-(void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    // 视频第一帧
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    
    // 播放按钮
    _playButton.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    
    
    
}

#pragma mark private method
-(void)_tapToPay{
    NSLog(@"asjdlask0");
    
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    
    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    AVPlayer *avPlayer = [AVPlayer playerWithPlayerItem:videoItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
    playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:playerLayer];
    
    [avPlayer play];
}

@end
