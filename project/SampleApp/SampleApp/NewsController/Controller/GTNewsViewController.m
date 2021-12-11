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


@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSMutableArray *dataArray;
@property(nonatomic, strong, readwrite) GTListLoader *listLoader;
@end
@implementation GTNewsViewController

- (instancetype)init{
    self = [super init];
    if (self){
        // 复制一份，避免使用同一个
        _dataArray = @[].mutableCopy;
        for (int i=0; i<20; ++i) {
            [_dataArray addObject:@(i)];
        }
    }
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
    [self.listLoader loadListData];
    
    // 把tableView加到整个视图结构中
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController *controller = [[GTDetailViewController alloc] init];
    controller.title = [NSString stringWithFormat:@"%@" , @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
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
    [cell layoutTableViewCell];
    
    return cell;
}


@end
