//
//  XBLoginController.m
//  拉钩一下
//
//  Created by 小白 on 16/3/8.
//  Copyright (c) 2016年 小白. All rights reserved.
//

#import "XBLoginController.h"

@interface XBLoginController ()  <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *logo;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLogoConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLogoConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLogoConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLogoConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoWidth;


@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *inputNameView;
@property (weak, nonatomic) IBOutlet UIView *inputPassView;


@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextField *inputPass;


@end

@implementation XBLoginController


#define LogoScreenWidth   [UIScreen mainScreen].bounds.size.width
#define LogoScreenHeight  [UIScreen mainScreen].bounds.size.height

- (IBAction)loginButton:(id)sender {
    [UIView animateWithDuration:1.0f animations:^{
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
        
        
        
    } completion:^(BOOL finished) {
        
    }];
}
#define LogoScreenMargin 20


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"zzz");
    [self.logo setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.logoWidth.constant = LogoScreenWidth * 0.2;
    self.logoHeight.constant = self.logoWidth.constant * 1.68;
    
    
    NSLog(@"!!!!!!!  %f  %f",self.logo.frame.size.width,self.logo.frame.size.height);
    //self.inputField.delegate = self;
    
   
}


-(void)logoAnimal{
    [UIView animateWithDuration:1.0f animations:^{
        self.logo.bounds = CGRectMake(0, 0, 0, 0);
    } completion:^(BOOL finished) {
        
    }];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
