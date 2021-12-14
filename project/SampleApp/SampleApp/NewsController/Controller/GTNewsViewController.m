//
//  GTNewsViewController.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/3.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTListLoader.h"
#import "GTListItem.h"


@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) GTListLoader *listLoader;
@end
@implementation GTNewsViewController

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个uitableview，大小等于整个UiViewController的大小
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    // load remote data
    self.listLoader = [[GTListLoader alloc] init];
    
    // 在block中处理一下self，防止循环引用
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        // 将请求到的数据赋值
        strongSelf.dataArray = dataArray;
        // 刷新当前列表
        [strongSelf.tableView reloadData];
        NSLog(@"");
    }];
    
    // 把tableView加到整个视图结构中
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    GTDetailViewController *controller = [[GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    controller.title = [NSString stringWithFormat:@"%@" , @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
    
    // 记录点击状态
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.title];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 列表长度
    return _dataArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"id"];
    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
