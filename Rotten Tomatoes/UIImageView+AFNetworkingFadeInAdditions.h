//
// Created by Tejas Lagvankar on 1/26/15.
// Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface UIImageView (AFNetworkingFadeInAdditions)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage fadeInWithDuration:(CGFloat)duration;

@end