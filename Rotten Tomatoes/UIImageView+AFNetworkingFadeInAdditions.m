//
// Created by Tejas Lagvankar on 1/26/15.
// Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "UIImageView+AFNetworkingFadeInAdditions.h"
#import "UIImageView+AFNetworking.h"


@implementation UIImageView (AFNetworkingFadeInAdditions)


- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage fadeInWithDuration:(CGFloat)duration {

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPShouldHandleCookies:NO];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];

    __weak typeof (self) weakSelf = self;

    [self setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (!request) // image was cached
            [weakSelf setImage:image];
        else
            [UIView transitionWithView:weakSelf duration:duration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [weakSelf setImage:image];
            } completion:nil];
    } failure:nil];

}

@end