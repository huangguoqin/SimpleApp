//
//  ViewController.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/3.
//

#import "ViewController.h"

@interface TestView : UIView // 创建一个自己的TestView，继承于UIView

@end

@implementation TestView
- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}
@end



@interface ViewController ()
@end
@implementation ViewController

- (instancetype)init{
    self = [super init];
    if (self){
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}// Called when the view is about to made visible. Default does nothing
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}// Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing


- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个uitableview，大小等于整个UiViewController的大小
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    // 把tableView加到整个视图结构中
    [self.view addSubview:tableView];
}

@end
