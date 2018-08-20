//
//  ViewController.m
//  YTKNetWorkManager
//
//  Created by grx on 2018/8/20.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "ViewController.h"
#import "HomeRequest.h"
#import "HomeResModel.h"

@interface ViewController ()<YTKRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 请求参数 */
    HomeResModel *model = [[HomeResModel alloc]init];
    model.phone = @"15810662320";
    model.loginPwd = @"123456";
    
    [self blockRequestData:model];
    [self delegateRequestData:model];
}

#pragma mark - block方式发起请求
-(void)blockRequestData:(HomeResModel *)model
{
    HomeRequest *request = [[HomeRequest alloc]init];
    request.model = model;
    [request requestHomeWithReturnBlock:^(NSDictionary *responseDict, NSString *code) {
        NSLog(@"block请求报文：%@===%@", code,responseDict);
    } WithFailBlock:^(NSError *error) {
        
    }];
}


#pragma mark - delegate方式发起请求
-(void)delegateRequestData:(HomeResModel *)model
{
    HomeRequest *request = [[HomeRequest alloc]init];
    request.model = model;
    request.delegate = self;
    [request start];
}

#pragma mark - YTKRequestDelegate
- (void)requestFinished:(YTKBaseRequest *)request
{
    NSDictionary *dict = (NSDictionary *)request.responseJSONObject;
    NSLog(@"delegate请求报文：%@", dict);
}

- (void)requestFailed:(YTKBaseRequest *)request
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
