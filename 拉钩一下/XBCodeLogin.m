//
//  XBCodeLogin.m
//  拉钩一下
//
//  Created by 小白 on 16/3/10.
//  Copyright (c) 2016年 小白. All rights reserved.
//

#import "XBCodeLogin.h"
#import "PureLayout.h"

@interface XBCodeLogin ()<UITextFieldDelegate>

@property (nonatomic, assign) BOOL didSetupConstraints;
@property (nonatomic,strong)UIView *centerLineView;
@property (nonatomic,strong)UIView *leftOrLineView;
@property (nonatomic,strong)UIView *rightOrLineView;
@property (nonatomic,strong)UILabel *orLabel;

@property (nonatomic,assign)BOOL isAnimatingToEndState;
@property (nonatomic, strong) NSLayoutConstraint *centerPointYConstraint;

@property (nonatomic,assign)CGRect logoFrame;

@end


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height




@implementation XBCodeLogin



-(instancetype)init{
    if (self = [super init]) {
        
    }
    //[self aa];
    NSLog(@"hehe  %f",ScreenWidth);
   [self endEditing:YES];
//    
//    1/ 15 = 100/15
//    
//    (ScreenWidth - 320 )/8
    
    return self;
}









- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
//        [self.logo autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        [self.logo autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:ScreenHeight/20];//在上边距是父控件的1/20
        [self.logo autoAlignAxisToSuperviewAxis:ALAxisVertical];//X轴的中心
        [self.logo autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.logo withMultiplier:1.68];//等比例设置
        [self.logo autoSetDimension:ALDimensionWidth toSize:ScreenWidth/5];//宽度设置
        
        
        [self.centerLineView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [self.centerLineView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [self.centerLineView autoSetDimensionsToSize:CGSizeMake(1, 1)];// 宽高1 相当于这是一个点
        
        [self.inputPassView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.centerLineView];//Y
        [self.inputPassView autoAlignAxisToSuperviewAxis:ALAxisVertical];//X轴的中心
        [self.inputPassView autoPinEdgeToSuperviewEdge:ALEdgeLeft];//都是左边距对齐
        [self.inputPassView autoPinEdgeToSuperviewEdge:ALEdgeRight];//都是左边距对齐
        [self.inputPassView autoSetDimension:ALDimensionHeight toSize:35 + (ScreenWidth - 320 )/8 ];//宽度设置

        [self.inputNameView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.inputPassView withOffset:-2];//Y
        [self.inputNameView autoAlignAxisToSuperviewAxis:ALAxisVertical];//X轴的中心
        [self.inputNameView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.inputPassView];//宽度相等
        [self.inputNameView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.inputPassView];//高度相等
        
        
        [self.loginButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.inputPassView withOffset: 8];//Y
        [self.loginButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.inputNameView];//都是左边距对齐
        [self.loginButton autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.inputPassView];//宽度相等
        [self.loginButton autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.inputPassView];//宽度相等
        
        [self.forgotPass autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.loginButton withOffset: 15];//Y
        [self.forgotPass autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.inputNameView];//都是左边距对齐
        [self.forgotPass autoSetDimensionsToSize:CGSizeMake(80, 20)];// 大小
        
        [self.orLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:ScreenHeight/12];//Y 在上边距是父控件的1/12
        [self.orLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];//X轴的中心
        [self.orLabel autoSetDimensionsToSize:CGSizeMake(80, 20)];// 大小
        
        [self.leftOrLineView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.orLabel];//Y 与它水平对齐
        [self.leftOrLineView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.inputPassView];//设置左对齐
        [self.leftOrLineView autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.orLabel];//设置右对齐
        [self.leftOrLineView autoSetDimension:ALDimensionHeight toSize:1];
        
        [self.rightOrLineView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.orLabel];//Y 与它水平对齐
        [self.rightOrLineView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self.inputPassView];//设置左对齐
        [self.rightOrLineView autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.orLabel];//设置右对齐
        [self.rightOrLineView autoSetDimension:ALDimensionHeight toSize:1];
        
        [self.registerLago autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.orLabel withOffset: -25];//Y
        [self.registerLago autoAlignAxisToSuperviewAxis:ALAxisVertical];//X轴的中心
        [self.registerLago autoSetDimensionsToSize:CGSizeMake(200, 10)];// 大小

        [self.noRegisterLago autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.orLabel withOffset: 10];//Y
        [self.noRegisterLago autoAlignAxisToSuperviewAxis:ALAxisVertical];//X轴的中心
        [self.noRegisterLago autoSetDimensionsToSize:CGSizeMake(100, 10)];// 大小

        //到这里整体布局完毕，下面是输入框内的两个布局
        /*
         @property (nonatomic,strong)UIImageView *nameImage;
         @property (nonatomic,strong)UITextField *nameInput;
         @property (nonatomic,strong)UIView *nameImageView;
         
         @property (nonatomic,strong)UIImageView *passImage;
         @property (nonatomic,strong)UITextField *passInput;
         @property (nonatomic,strong)UIView *passImageView;

         */
        
      //  [self.inputNameView ];
        
        [self.nameImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.nameImageView];
        [self.nameImageView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.inputNameView];
        [self.nameImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.nameImageView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        
        [self.nameImage autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(11, 11, 11, 11)];
        
        [self.nameInput autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.nameInput autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameImageView withOffset:10];
        [self.nameInput autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.nameInput autoPinEdgeToSuperviewEdge:ALEdgeRight];
        
        [self.passImageView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionHeight ofView:self.passImageView];
        [self.passImageView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.inputPassView];
        [self.passImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
        [self.passImageView autoPinEdgeToSuperviewEdge:ALEdgeTop];
        
        [self.passImage autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(11, 11, 11, 11)];
        
        [self.passInput autoPinEdgeToSuperviewEdge:ALEdgeTop];
        [self.passInput autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameImageView withOffset:10];
        [self.passInput autoPinEdgeToSuperviewEdge:ALEdgeBottom];
        [self.passInput autoPinEdgeToSuperviewEdge:ALEdgeRight];
    
        self.didSetupConstraints = YES;
    }
//    
//    [self.centerPointYConstraint autoRemove];
//    
//    if (self.isAnimatingToEndState) {
//        
//      //  [self.centerLineView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.superview withOffset:50];
//        self.centerPointYConstraint = [self.centerLineView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.superview withOffset:-80];
//    } else {
//     //   [self.centerLineView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//        self.centerPointYConstraint = [self.centerLineView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//    }

    
    
    
       NSLog(@"what fuch");
    [super updateConstraints];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self logoAnimation];
    if (textField.tag == 1) {
        [self.nameImage setImage:[UIImage imageNamed:@"icon_email_nor"]];
        [self.passImage setImage:[UIImage imageNamed:@"icon_password_pre"]];
    }else{
        [self.passImage setImage:[UIImage imageNamed:@"icon_password_nor"]];
        [self.nameImage setImage:[UIImage imageNamed:@"icon_email_pre"]];
    }
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField.tag == 2) {
        [self.nameImage setImage:[UIImage imageNamed:@"icon_email_nor"]];
    }else{
        [self.passImage setImage:[UIImage imageNamed:@"icon_password_nor"]];
    }
    
    
    return YES;
}


-(void)toChangeInputNameViewImage{
    if ([self.nameInput becomeFirstResponder]) {
        [self.nameImage setImage:[UIImage imageNamed:@"icon_email_nor"]];
    }else{
        
    }
}


-(void)logoAnimation{
    
     if (self.isAnimatingToEndState == NO) {
         
     
    
    self.logoFrame = self.logo.bounds;
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:0
                     animations:^{

                         self.logo.bounds = CGRectMake(0, 0, 0, 0);
                         
                         
                         CGRect name = self.inputNameView.frame;
                         name.origin.y -= 80;
                         self.inputNameView.frame = name;
                         
                         CGRect pass = self.inputPassView.frame;
                         pass.origin.y -= 80;
                         self.inputPassView.frame = pass;
                         
                         CGRect login = self.loginButton.frame;
                         login.origin.y -= 80;
                         self.loginButton.frame = login;
                         
                         
                         
                     }
                     completion:^(BOOL finished) {
                         self.isAnimatingToEndState = YES;
                         
                         
                     }];
     }
}

-(void)logoNormal{
    if (self.isAnimatingToEndState == YES) {

    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:0
                     animations:^{
                         // [self updateConstraints];
                         self.logo.bounds = self.logoFrame;
                         
                         
                         CGRect name = self.inputNameView.frame;
                         name.origin.y += 80;
                         self.inputNameView.frame = name;
                         
                         CGRect pass = self.inputPassView.frame;
                         pass.origin.y += 80;
                         self.inputPassView.frame = pass;
                         
                         CGRect login = self.loginButton.frame;
                         login.origin.y += 80;
                         self.loginButton.frame = login;
                         
                         
                     }
                     completion:^(BOOL finished) {
                         self.isAnimatingToEndState = !self.isAnimatingToEndState;
                         
                         
                     }];
    }

}



-(void)loginButtonClick{
   
    [self logoNormal];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (UIImageView *)logo
{
    if (!_logo) {
        _logo = [UIImageView newAutoLayoutView];
        _logo.image = [UIImage imageNamed:@"logo_new"];
        [self addSubview:_logo];
    }
    return _logo;
}

- (UIView *)inputNameView
{
    if (!_inputNameView) {
        _inputNameView = [UIView newAutoLayoutView];

        _inputNameView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:00 alpha:0.2];
        
        [_inputNameView addSubview:self.nameInput];
        [_inputNameView addSubview:self.nameImageView];
        
        [self addSubview:_inputNameView];
    }
    return _inputNameView;
}


- (UIView *)inputPassView
{
    if (!_inputPassView) {
        _inputPassView = [UIView newAutoLayoutView];

        
        _inputPassView.backgroundColor = [UIColor colorWithRed:0 green:18/255 blue:0/255 alpha:0.2];
        [_inputPassView addSubview:self.passInput];
        [_inputPassView addSubview:self.passImageView];
        
        [self addSubview:_inputPassView];
    }
    return _inputPassView;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton newAutoLayoutView];
        _loginButton.backgroundColor = [UIColor colorWithRed:0.1f green:0.76f blue:0.5f alpha:1];
        [_loginButton setTitle:@"登 录" forState:UIControlStateNormal];
        [self.loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_loginButton];
    }
    return _loginButton;
}

- (UIButton *)forgotPass
{
    if (!_forgotPass) {
        _forgotPass = [UIButton newAutoLayoutView];
        _forgotPass.titleLabel.font = [UIFont systemFontOfSize:15];
        [_forgotPass setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgotPass setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];

        [self addSubview:_forgotPass];
    }
    return _forgotPass;
}

- (UIButton *)registerLago
{
    if (!_registerLago) {
        _registerLago = [UIButton newAutoLayoutView];
        [_registerLago setTitle:@"还没有注册拉勾" forState:UIControlStateNormal];
        [_registerLago setTitleColor:[UIColor colorWithRed:0.1f green:0.76f blue:0.5f alpha:1] forState:UIControlStateNormal];
        _registerLago.titleLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_registerLago];
    }
    return _registerLago;
}

- (UIButton *)noRegisterLago
{
    if (!_noRegisterLago) {
        _noRegisterLago = [UIButton newAutoLayoutView];
        [_noRegisterLago setTitle:@"随便逛逛" forState:UIControlStateNormal];
        _noRegisterLago.titleLabel.font = [UIFont systemFontOfSize:15];
        [_noRegisterLago setTitleColor:[UIColor colorWithRed:0.1f green:0.76f blue:0.5f alpha:1] forState:UIControlStateNormal];
        [self addSubview:_noRegisterLago];
    }
    return _noRegisterLago;
}


- (UIView *)centerLineView
{
    if (!_centerLineView) {
        _centerLineView = [UIView newAutoLayoutView];
        
        [self addSubview:_centerLineView];
    }
    return _centerLineView;
}


- (UIView *)leftOrLineView
{
    if (!_leftOrLineView) {
        _leftOrLineView = [UIView newAutoLayoutView];
        _leftOrLineView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
        [self addSubview:_leftOrLineView];
    }
    return _leftOrLineView;
}

- (UIView *)rightOrLineView
{
    if (!_rightOrLineView) {
        _rightOrLineView = [UIView newAutoLayoutView];
        _rightOrLineView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.4];
        [self addSubview:_rightOrLineView];
    }
    return _rightOrLineView;
}

- (UILabel *)orLabel
{
    if (!_orLabel) {
        _orLabel = [UILabel newAutoLayoutView];
        _orLabel.textAlignment = NSTextAlignmentCenter;
        [_orLabel setText:@"or"];
        [_orLabel setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.6]];
        [self addSubview:_orLabel];
    }
    return _orLabel;
}

-(UIView *)nameImageView{
    if (!_nameImageView) {
        _nameImageView = [UIView newAutoLayoutView];
        _nameImageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [_nameImageView addSubview:self.nameImage];
    }
    return _nameImageView;
}

-(UIView *)passImageView{
    if (!_passImageView) {
        _passImageView = [UIView newAutoLayoutView];
        _passImageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [_passImageView addSubview:self.passImage];
    }
    return _passImageView;
}


-(UIImageView *)nameImage{
    if (!_nameImage) {
        _nameImage = [UIImageView newAutoLayoutView];
        _nameImage.image = [UIImage imageNamed:@"icon_email_pre"];
     
    }
    return _nameImage;
}

-(UIImageView *)passImage{
    if (!_passImage) {
        _passImage = [UIImageView newAutoLayoutView];
        _passImage.image = [UIImage imageNamed:@"icon_password_pre"];
        
    }
    return _passImage;
}

-(UITextField *)nameInput{
    if (!_nameInput) {
        _nameInput = [UITextField newAutoLayoutView];
        [_nameInput setTextColor:[UIColor whiteColor]];
        [_nameInput setPlaceholder:@"请输入用户名"];
        [_nameInput setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3] forKeyPath:@"_placeholderLabel.textColor"];
        _nameInput.delegate = self;
        _nameInput.tag = 1;
    }
    return _nameInput;
}

-(UITextField *)passInput{
    if (!_passInput) {
        _passInput = [UITextField newAutoLayoutView];
        [_passInput setTextColor:[UIColor whiteColor]];
        [_passInput setSecureTextEntry:YES];
        [_passInput setPlaceholder:@"请输入密码"];
        [_passInput setValue:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3] forKeyPath:@"_placeholderLabel.textColor"];
        _passInput.delegate = self;
        _passInput.tag = 2;
    }
    return _passInput;
}









@end






