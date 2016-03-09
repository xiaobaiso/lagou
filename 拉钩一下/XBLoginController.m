//
//  XBLoginController.m
//  拉钩一下
//
//  Created by 小白 on 16/3/8.
//  Copyright (c) 2016年 小白. All rights reserved.
//

#import "XBLoginController.h"

@interface XBLoginController ()
@property (weak, nonatomic) IBOutlet UIImageView *logo;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLogoConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLogoConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLogoConstraint;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLogoConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoWidth;
@property (weak, nonatomic) IBOutlet UIView *inputNameView;
@property (weak, nonatomic) IBOutlet UIView *inputPassView;


@end

@implementation XBLoginController


#define LogoScreenWidth   [UIScreen mainScreen].bounds.size.width
#define LogoScreenHeight  [UIScreen mainScreen].bounds.size.height

#define LogoScreenMargin 20


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"zzz");
    [self.logo setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.logoWidth.constant = LogoScreenWidth * 0.2;
    self.logoHeight.constant = self.logoWidth.constant * 1.68;
    
    
    
    
//    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 236, self.view.frame.size.width, 1/[[UIScreen mainScreen] scale])];
//    viewLine.backgroundColor = [UIColor redColor];
//    [self.view addSubview:viewLine];
//    
    
    
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
