//
//  NXAudioWave.h
//  FYJWave
//
//  Created by NingXia on 2023/12/1.
//  Copyright © 2023 fyj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NXAudioWave : UIView

//浪高 默认为5
@property (nonatomic) CGFloat waveHeight;
//浪曲度 默认为1
@property (nonatomic) CGFloat waveCurve;
//浪速 默认为1
@property (nonatomic) CGFloat waveSpeed;
//实浪颜色 默认为蓝色
@property (nonatomic, copy) UIColor *realWaveColor;
//遮罩浪颜色 默认为蓝色+0.5的透明度
@property (nonatomic, copy) UIColor *maskWaveColor;

//开始浪
- (void)startWaveAnimation;
//停止浪
- (void)endWaveAnimation;

@end

NS_ASSUME_NONNULL_END
