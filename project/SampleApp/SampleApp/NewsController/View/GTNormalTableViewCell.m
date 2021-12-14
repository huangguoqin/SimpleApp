//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by 黄某某 on 2021/12/8.
//  Copyright © 2021 黄某某. All rights reserved.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface GTNormalTableViewCell()

// 定义属性
@property(nonatomic, strong, readwrite) UILabel *titleLable;
@property(nonatomic, strong, readwrite) UILabel *sourceLable;
@property(nonatomic, strong, readwrite) UILabel *commentLable;
@property(nonatomic, strong, readwrite) UILabel *timeLable;

@property(nonatomic, strong, readwrite) UIImageView *rightImabeView;

@property(nonatomic, strong, readwrite) UIButton *deleteButton;


@end

@implementation GTNormalTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        // 添加属性到到cell中
        [self.contentView addSubview:({
            self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
//            self.titleLable.backgroundColor = [UIColor redColor];
            self.titleLable.font = [UIFont systemFontOfSize:16];
            self.titleLable.textColor = [UIColor blackColor];
            self.titleLable.numberOfLines = 2;
            // 文字截断末尾显示...
            self.titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLable;
        })];
        [self.contentView addSubview:({
            self.sourceLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
//            self.sourceLable.backgroundColor = [UIColor blueColor];
            self.sourceLable.font = [UIFont systemFontOfSize:12];
            self.sourceLable;
        })];
        [self.contentView addSubview:({
            self.commentLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
//            self.commentLable.backgroundColor = [UIColor greenColor];
            self.commentLable.font = [UIFont systemFontOfSize:12];
            self.commentLable.textColor = [UIColor grayColor];
            self.commentLable;
        })];
        [self.contentView addSubview:({
            self.timeLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 50, 20)];
            self.timeLable.backgroundColor = [UIColor cyanColor];
            self.timeLable.font = [UIFont systemFontOfSize:12];
            self.timeLable.textColor = [UIColor grayColor];
            self.timeLable;
        })];
        
        [self.contentView addSubview:({
            self.rightImabeView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
            self.rightImabeView.backgroundColor = [UIColor redColor];
            self.rightImabeView;
        })];
        
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
////            self.deleteButton.backgroundColor = [UIColor blueColor];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//
//            self.deleteButton.layer.cornerRadius = 10;
//            self.deleteButton.layer.masksToBounds = YES;
//
//            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.deleteButton.layer.borderWidth = 2;
//
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
    }
    return self;
}

// 定义一个实例方法，在.h文件中暴露给外界调用（挂在cell时调用）
-(void)layoutTableViewCellWithItem:(GTListItem *) item{
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.title];
    if(hasRead){
        self.titleLable.textColor = [UIColor grayColor];
    }else{
        self.titleLable.textColor = [UIColor blackColor];
    }
    
    self.titleLable.text = item.title;
    
    self.sourceLable.text = item.authorName;
    // 宽高自适应
    [self.sourceLable sizeToFit];
    
    
    self.commentLable.text = item.category;
    [self.commentLable sizeToFit];
    // self.sourceLable.frame.origin.x 来源的x self.sourceLable.frame.size.width来源的宽度
    self.commentLable.frame = CGRectMake(self.sourceLable.frame.origin.x + self.sourceLable.frame.size.width +15, self.commentLable.frame.origin.y, self.commentLable.frame.size.width, self.commentLable.frame.size.height);
    
    
    self.timeLable.text = item.date;
    [self.timeLable sizeToFit];
    // commentLable 评论的x，self.commentLable.frame.size.width 评论的宽度
    self.timeLable.frame = CGRectMake(self.commentLable.frame.origin.x + self.commentLable.frame.size.width +15, self.timeLable.frame.origin.y, self.timeLable.frame.size.width, self.timeLable.frame.size.height);
    
    // 设置图片
#warning
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//    self.rightImabeView.image = [UIImage imageNamed:@"icon.bundle/icon.png"];
    self.rightImabeView.image = image;
}

-(void) deleteButtonClick{
    NSLog(@"deleteButtonClick");
}
@end
