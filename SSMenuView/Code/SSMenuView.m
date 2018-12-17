//
//  SSMenuView.m
//  menuDemo
//
//  Created by sun on 2018/12/7.
//  Copyright © 2018年 sunny. All rights reserved.
//

#import "SSMenuView.h"
#import "ItemCell.h"
#define SS_ScreenW [UIScreen mainScreen].bounds.size.width
#define SS_ScreenH [UIScreen mainScreen].bounds.size.height

static CGFloat contentH = 300.0;

@interface SSMenuView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIView *contentView;

@property (nonatomic, strong)UITableView *tbView;

@end

@implementation SSMenuView

+ (void)load{
    
}

+ (void)initialize{
    
}

- (instancetype)init{
    if (self = [super init]) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) { 
    }
    return self;
}

- (void)createUI{
    self.frame = CGRectMake(0, 0, SS_ScreenW, SS_ScreenH);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    [self.contentView addSubview:self.tbView];
    self.tbView.frame = CGRectMake(0, 0, SS_ScreenW, contentH);
}

# pragma
# pragma mark - public -
- (void)showInView:(UIView *)view{
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:self.contentView];
    self.contentView.frame = CGRectMake(0, SS_ScreenH, SS_ScreenW, contentH);
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
        self.contentView.frame = CGRectMake(0, SS_ScreenH - contentH, SS_ScreenW, contentH);
    } completion:^(BOOL finished) {
        
    }];
} 

- (void)disMissView{
    
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.0;
        self.contentView.frame = CGRectMake(0, SS_ScreenH, SS_ScreenW, contentH);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
    }];
}

# pragma
# pragma mark - d d -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(menuTableView:didSelectRowAtIndexPath:)]) {
        [self.delegate menuTableView:tableView didSelectRowAtIndexPath:indexPath];
    } 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(menuTableView:numberOfRowsInSection:)]) {
        return [self.delegate menuTableView:tableView numberOfRowsInSection:section];
    }else if (self.dataArr){
        return self.dataArr.count;
    }else{
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if ([self.delegate respondsToSelector:@selector(menuTableView:cellForRowAtIndexPath:)]) {
        return [self.delegate menuTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCellID"];
//        cell.backgroundColor = [UIColor redColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(menuTableView:heightForRowAtIndexPath:)]) {
         return [self.delegate menuTableView:tableView heightForRowAtIndexPath:indexPath];
    }else{
        return 52;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(menuTableView:viewForHeaderInSection:)]) {
        return [self.delegate menuTableView:tableView viewForHeaderInSection:section];
    }else{
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        
        UIButton *btn = [UIButton new];
        [view addSubview:btn];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        btn.frame = CGRectMake(375 - 15 - 80, 5, 80, 30);
        btn.backgroundColor = [UIColor redColor];
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(0 ,39 , 375, 1);
        line.layer.backgroundColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
        [view addSubview:line];
        return view;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(menuTableView:heightForHeaderInSection:)]) {
        return [self.delegate menuTableView:tableView heightForHeaderInSection:section];
    }else{
        return 40;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

# pragma
# pragma mark - SET -
- (void)setContentHeight:(CGFloat)contentHeight{
    _contentHeight = contentHeight;
    contentH = contentHeight;
    [self createUI];
}

# pragma
# pragma mark - lazy -
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.frame = CGRectMake(0, SS_ScreenH - contentH, SS_ScreenW, contentH);
        _contentView.opaque = YES;
        [self addSubview:_contentView];
    }
    return _contentView;
}

- (UITableView *)tbView{
    if (!_tbView) {
        _tbView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tbView.delegate = self;
        _tbView.dataSource = self;
        [_tbView registerClass:[ItemCell class] forCellReuseIdentifier:@"ItemCellID"];
        _tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tbView;
}


@end



