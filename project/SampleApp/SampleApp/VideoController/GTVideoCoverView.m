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


@property(nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property(nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property(nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;
// 视频缩略图
@property(nonatomic, strong, readwrite) UIImageView *coverView;

// 播放按钮
@property(nonatomic, strong, readwrite) UIImageView *playButton;

// 视频播放url
@property(nonatomic, copy, readwrite) NSString *videoUrl;
    
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
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlerPlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}
- (void)dealloc
{
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
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
    
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playerLayer];
    
    
}

-(void)_handlerPlayEnd{
    NSLog(@"视频播放完毕");
    
    // 将视频播放器移除
    [_playerLayer removeFromSuperlayer];
    
    _avPlayer = nil;
    _videoItem = nil;
}


#pragma mark KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"status"]){
        // 判断视频是否加载完毕
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
            [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }
}

@end
