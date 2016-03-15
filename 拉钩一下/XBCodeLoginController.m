//
//  XBCodeLoginController.m
//  拉钩一下
//
//  Created by 小白 on 16/3/9.
//  Copyright (c) 2016年 小白. All rights reserved.
//

#import "XBCodeLoginController.h"
#import "XBCodeLogin.h"
#import "PureLayout.h"


#define loginViewMargin  15.0f

@interface XBCodeLoginController ()

@property (nonatomic, assign) BOOL didSetupConstraints;
@property (nonatomic,strong)XBCodeLogin *loginView;
@property (nonatomic,strong)UIImageView *backImageView;
@end

@implementation XBCodeLoginController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *backImageView = [[UIImageView alloc] init];
    backImageView.image = [UIImage imageNamed:@"four_screen_bg"];
    self.backImageView = backImageView;
    [self.view addSubview:backImageView];
    
    XBCodeLogin *loginView = [[XBCodeLogin alloc] init];
    loginView.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginView = loginView;
    [self.view addSubview:loginView];
    
//    ALEdgeInsets defInsets = ALEdgeInsetsMake(20.0, 20.0, 20.0, 20.0);
//    [loginView autoPinEdgesToSuperviewEdgesWithInsets:defInsets excludingEdge:ALEdgeBottom];
//    
  //  self.loginView.backgroundColor = [UIColor redColor];
   
     [self.view setNeedsUpdateConstraints]; // bootstrap Auto Layout
    //  [self.loginView setNeedsUpdateConstraints]; // bootstrap Auto Layout
    
}


- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        //距离父控件的边距
        [self.loginView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:loginViewMargin];
        [self.loginView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:loginViewMargin];
        [self.loginView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:loginViewMargin];
        [self.loginView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:loginViewMargin];
       
        [self.backImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        
        
        self.didSetupConstraints = YES;
    }
    
    [super updateViewConstraints];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
