//
//  HomeRequest.h
//  YTKNetWorkManager
//
//  Created by grx on 2018/8/20.
//  Copyright © 2018年 grx. All rights reserved.
//

#import "YTKRequest.h"
#import "HomeResModel.h"

@interface HomeRequest : YTKRequest
typedef void (^ReturnBlock)(NSDictionary *responseDict,NSString *code);
typedef void (^FailureBlock)(NSError* error);

@property (nonatomic,strong) HomeResModel *model;

- (void)requestHomeWithReturnBlock:(ReturnBlock)succesReturnBlock WithFailBlock:(FailureBlock)failureBlock;

@end
