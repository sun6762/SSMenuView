//
//  SSMenuView.h
//  menuDemo
//
//  Created by sun on 2018/12/7.
//  Copyright © 2018年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SSMenuViewDelegate; 
@interface SSMenuView : UIView

// 源数据
@property (nonatomic, strong)NSArray *dataArr;
// 选项 tableView 的代理
@property (nonatomic, weak)id <SSMenuViewDelegate>delegate;
// 展示内容view的高度
@property (nonatomic, assign)CGFloat contentHeight;


//- (void)showInView:(UIView *)view dataArr:(NSArray *)dataArr selectedModel:(id)model resultBlock:(void(^)(id model))resultBlock;
// 展示在父 view 上
- (void)showInView:(UIView *)view;
// dismiss menuView
- (void)disMissView;

@end

@protocol SSMenuViewDelegate <NSObject>
@required;
// 返回 tableView 的行数
- (NSInteger)menuTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
// 返回 tableViewCell 需要自定义 cell 的分割线
- (UITableViewCell *)menuTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional;
// 选中某个 tableView Cell
- (void)menuTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

// 定义headerView
- (CGFloat)menuTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
// 定义headerView
- (UIView *)menuTableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
// 定义headerView 的高度
- (CGFloat)menuTableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

@end


NS_ASSUME_NONNULL_END


@interface SSMenuCell : UITableViewCell


@end
