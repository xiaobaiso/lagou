//
//  XBCodeLogin.h
//  拉钩一下
//
//  Created by 小白 on 16/3/10.
//  Copyright (c) 2016年 小白. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBCodeLogin : UIView

@property (nonatomic,strong)UIImageView *logo;
@property (nonatomic,strong)UIView *inputNameView;
@property (nonatomic,strong)UIView *inputPassView;

@property (nonatomic,strong)UIImageView *nameImage;
@property (nonatomic,strong)UITextField *nameInput;
@property (nonatomic,strong)UIView *nameImageView;

@property (nonatomic,strong)UIImageView *passImage;
@property (nonatomic,strong)UITextField *passInput;
@property (nonatomic,strong)UIView *passImageView;


@property (nonatomic,strong)UIButton *loginButton;
@property (nonatomic,strong)UIButton *forgotPass;
@property (nonatomic,strong)UIButton *registerLago;
@property (nonatomic,strong)UIButton *noRegisterLago;

@end
