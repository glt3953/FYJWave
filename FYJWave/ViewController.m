//
//  ViewController.m
//  FYJWave
//
//  Created by fyj on 2017/11/23.
//  Copyright © 2017年 fyj. All rights reserved.
//

#import "ViewController.h"
#import "FYJWave.h"
#import "NXAudioWave.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建FYJWave浪对象
    FYJWave *fyjWave = [[FYJWave alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    fyjWave.backgroundColor = [UIColor whiteColor];
    fyjWave.realWaveColor = [UIColor redColor];
    fyjWave.waveSpeed = 5;
    [self.view addSubview:fyjWave];
    //4.开始动画
    [fyjWave startWaveAnimation];
    
    //1.创建FYJWave浪对象
    fyjWave = [[FYJWave alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 50)];
    fyjWave.backgroundColor = [UIColor redColor];
    fyjWave.waveSpeed = 15;
    [self.view addSubview:fyjWave];
    //4.开始动画
    [fyjWave startWaveAnimation];
    
    //1.创建NXAudioWave浪对象
    NXAudioWave *nxAudioWave = [[NXAudioWave alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 100)];
    nxAudioWave.backgroundColor = [UIColor whiteColor];
    nxAudioWave.realWaveColor = [UIColor blueColor];
    nxAudioWave.maskWaveColor = [[UIColor greenColor] colorWithAlphaComponent:0.5];
    nxAudioWave.waveHeight = 15;
    nxAudioWave.waveSpeed = 15;
    [self.view addSubview:nxAudioWave];
    //4.开始动画
    [nxAudioWave startWaveAnimation];
  
//    //2.创建头像
//    CGFloat imageWidth = 60;
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - imageWidth/2, 10, imageWidth, 60)];
//    imageView.image = [UIImage imageNamed:@"head"];
//    imageView.layer.cornerRadius = 30;
//    imageView.clipsToBounds = YES;
//    imageView.layer.borderWidth = 5;
//    imageView.layer.borderColor = [UIColor yellowColor].CGColor;
//    [self.view addSubview:imageView];
//    
//    //3.根据传回的centerY值修改头像的Y坐标
//    [fyjWave setWaveFloatYCallBack:^(CGFloat centerY) {
//        CGRect frame = imageView.frame;
//        frame.origin.y = (200 + 10) + 5 + centerY - 60;
//        imageView.frame = frame;
//    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
