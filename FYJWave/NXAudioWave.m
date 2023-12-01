//
//  NXAudioWave.m
//  FYJWave
//
//  Created by NingXia on 2023/12/1.
//  Copyright © 2023 fyj. All rights reserved.
//

#import "NXAudioWave.h"

@interface NXAudioWave()

@property(nonatomic) CGFloat offset;
//帧刷新器
@property (nonatomic, strong) CADisplayLink *displayLink;
//真实浪
@property (nonatomic, weak) CAShapeLayer *realWaveShapeLayer;
//遮罩浪
@property (nonatomic, weak) CAShapeLayer *maskWaveShareLayer;

@end

@implementation NXAudioWave

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initData];
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self initData];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initData];
    }
    
    return self;
}

#pragma mark - 默认配置
- (void)initData {
    _waveHeight = 5;
    _waveCurve = 1;
    _waveSpeed = 1;
    
    [self.layer addSublayer:self.realWaveShapeLayer];
    [self.layer addSublayer:self.maskWaveShareLayer];
    
    _realWaveColor = [UIColor blueColor];
    _maskWaveColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
}

#pragma mark - lazy load
- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(wave)];
    }
    
    return _displayLink;
}

- (CAShapeLayer *)realWaveShapeLayer {
    if (!_realWaveShapeLayer) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = [self getWaveFrame];
        _realWaveShapeLayer = layer;
    }
    
    return _realWaveShapeLayer;
}

- (CAShapeLayer *)maskWaveShareLayer {
    if (!_maskWaveShareLayer) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = [self getWaveFrame];
        _maskWaveShareLayer = layer;
    }
    
    return _maskWaveShareLayer;
}

- (CGRect)getWaveFrame {
    CGRect frame = self.bounds;
    frame.origin.y = frame.size.height - _waveHeight;
    frame.size.height = _waveHeight;
    
    return frame;
}

#pragma mark - 自定义配置
- (void)setWaveHeight:(CGFloat)waveHeight {
    _waveHeight = waveHeight;
    _realWaveShapeLayer.frame = [self getWaveFrame];
    _maskWaveShareLayer.frame = [self getWaveFrame];
}

#pragma mark - 创建浪
- (void)wave {
    //每次循环变动
    _offset += _waveSpeed;
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = _waveHeight;
    
    //创建上行浪
    [self createWaveWithShapeLayer:_realWaveShapeLayer width:width height:height offset:_offset waveWolor:_realWaveColor];
    //创建下行浪
    [self createWaveWithShapeLayer:_maskWaveShareLayer width:width height:height offset:_offset*0.7 waveWolor:_maskWaveColor];
}

//创建浪
- (void)createWaveWithShapeLayer:(CAShapeLayer *)waveShapeLayer width:(CGFloat)width height:(CGFloat)height offset:(CGFloat)offset waveWolor:(UIColor *)waveWolor
{
    //创建浪的路径
    CGMutablePathRef wavePath = CGPathCreateMutable();
    
    //创建一个起点
    CGPathMoveToPoint(wavePath, NULL, 0, height);
    
    //创建中间点
    for (int x = 0; x < width; x++) {
        //y = Asin（ωx+φ）
        CGFloat y = height * sinf(self.waveCurve * x * M_PI / 180 + offset * M_PI / 180);
        CGPathAddLineToPoint(wavePath, NULL, x, y);
    }
    
    //调整填充路径
    CGPathAddLineToPoint(wavePath, NULL, width, height);
    CGPathAddLineToPoint(wavePath, NULL, 0, height);
    
    //结束路径
    CGPathCloseSubpath(wavePath);
    
    //用路径创建浪
    waveShapeLayer.path = wavePath;
    waveShapeLayer.fillColor = waveWolor.CGColor;
    
    //释放浪路径
    CGPathRelease(wavePath);
}

#pragma mark - 开始浪
- (void)startWaveAnimation {
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark - 停止浪
- (void)endWaveAnimation {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

@end
