//
//  HomeRequest.m
//  YTKNetWorkManager
//
//  Created by grx on 2018/8/20.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "HomeRequest.h"
#import "MJExtension.h"

@interface HomeRequest (){
    HomeResModel *_resModel;
}

@end

@implementation HomeRequest

- (NSString *)requestUrl
{
    return @"login/goLogin";
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

-(void)setModel:(HomeResModel *)model
{
    _resModel = model;
}

- (id)requestArgument
{
    NSDictionary * dataDic = [_resModel mj_keyValues];
    return dataDic;
}

#pragma mark - 发起请求封装
- (void)requestHomeWithReturnBlock:(ReturnBlock)succesReturnBlock WithFailBlock:(FailureBlock)failureBlock
{
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSString *code = [NSString stringWithFormat:@"%@",request.responseObject[@"code"]];
        succesReturnBlock(request.responseObject,code);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        failureBlock(request.error);
    }];
}

@end
