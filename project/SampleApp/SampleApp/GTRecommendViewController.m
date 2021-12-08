//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/8.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate>

@end

@implementation GTRecommendViewController

- (instancetype) init{
    self = [super init];
    if(self){
        self.view.backgroundColor = [UIColor greenColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"ico.bundle/like_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor grayColor];
    
    // set content size
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    
    
    
    
    // 声明一个颜色数组
    NSArray *colorArray = @[
        [UIColor redColor],
        [UIColor blueColor],
        [UIColor greenColor],
        [UIColor grayColor],
        [UIColor cyanColor]
    ];
    
    // 创建5个uiview填充content
    for (int i = 0; i < 5; ++i) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
            // 设置背景色
            view.backgroundColor = colorArray[i];
            view;
        })];
    }
    
    // 启用pagingEnabled，翻页效果
    scrollView.pagingEnabled = YES;
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
}

// 滚动-监听⻚⾯滚动，以及根据Offset做业务逻辑
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll - %@", @(scrollView.contentOffset.x) );
}

// 拖拽-中断⼀些业务逻辑，如视频/gif播放
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging");
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)){
    NSLog(@"scrollViewWillEndDragging");
}
//减速-⻚⾯停⽌时开始逻辑，如视频⾃动播放
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDecelerating");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
}



@end
