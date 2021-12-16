//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/8.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"

@interface GTVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GTVideoViewController

// 实例化后执行的代码
- (instancetype) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"ico.bundle/video_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 两个cell之间的最小行间距
    flowLayout.minimumLineSpacing = 10;
    // 每一列的最小间距
    flowLayout.minimumInteritemSpacing = 10;
    // 每个cell的大小,self.view.frame.size.width表示整个屏幕的宽度
    flowLayout.itemSize = CGSizeMake( (self.view.frame.size.width-10)/2, 300);
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    //    必须先注册 Cell 类型⽤于重⽤
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    
    [self.view addSubview:collectionView];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 如果没有已创建的cell，系统会调用注册的cell创建方法自动创建一个
    GTVideoCoverView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVideoCoverView" forIndexPath:indexPath];
    if([cell isKindOfClass:[GTVideoCoverView class]]){
        [(GTVideoCoverView*)cell layoutWithVideoCoverUrl:@"icon.bundle/splash.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width / 16 * 9);
}

@end
