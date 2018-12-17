//
//  ViewController.m
//  SSMenuView
//
//  Created by sun on 2018/12/13.
//  Copyright © 2018年 Sun. All rights reserved.
//

#import "ViewController.h"
#import "SSMenuView.h"

@interface ViewController ()<SSMenuViewDelegate>

@property (nonatomic, strong)SSMenuView *menuView;

@end

@implementation ViewController
- (SSMenuView *)menuView{
    if (!_menuView) {
        _menuView = [SSMenuView new];
//        _menuView.delegate = self;
        _menuView.contentHeight = 350.0;
    }
    return _menuView;
}
- (IBAction)button:(id)sender {
    [self.menuView showInView:self.view];
}

- (NSInteger)menuTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)menuTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ss"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"ss"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:self.menuView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
