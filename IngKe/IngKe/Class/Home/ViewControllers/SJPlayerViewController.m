//
//  SJPlayerViewController.m
//  IngKe
//
//  Created by diqiuren on 2016/12/12.
//  Copyright © 2016年 qust. All rights reserved.
//

#import "SJPlayerViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface SJPlayerViewController ()

@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@end

@implementation SJPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

//    [self.view addSubview:self.mediaControl];
    
//    self.mediaControl.delegatePlayer = self.player;
    [self.player prepareToPlay];
}

#pragma mark - 懒加载

- (IJKFFMoviePlayerController *)player
{
    if (_player == nil) {
        
#ifdef DEBUG
        [IJKFFMoviePlayerController setLogReport:YES];
        [IJKFFMoviePlayerController setLogLevel:k_IJK_LOG_DEBUG];
#else
        [IJKFFMoviePlayerController setLogReport:NO];
        [IJKFFMoviePlayerController setLogLevel:k_IJK_LOG_INFO];
#endif
        
        [IJKFFMoviePlayerController checkIfFFmpegVersionMatch:YES];
        // [IJKFFMoviePlayerController checkIfPlayerVersionMatch:YES major:1 minor:0 micro:0];
        
        IJKFFOptions *options = [IJKFFOptions optionsByDefault];
        
        _player = [[IJKFFMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:_model.streamAddr] withOptions:options];
        _player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _player.view.frame = self.view.bounds;
//        _player.scalingMode = IJKMPMovieScalingModeAspectFit;
        _player.shouldAutoplay = YES;
        
        _player.view.autoresizesSubviews = YES;
        [self.view addSubview:_player.view];
    }
    return _player;
}

#pragma mark - delloc

- (void)dealloc
{
    [self.player shutdown];
}


@end
