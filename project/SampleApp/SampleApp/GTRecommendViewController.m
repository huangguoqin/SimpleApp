//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/8.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()

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
    
    [self.view addSubview:scrollView];
}


@end
