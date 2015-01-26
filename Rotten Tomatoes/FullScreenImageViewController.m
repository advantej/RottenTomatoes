//
//  FullScreenImageViewController.m
//  Rotten Tomatoes
//
//  Created by Tejas Lagvankar on 1/26/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "FullScreenImageViewController.h"

@interface FullScreenImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewMoviePoster;

@end

@implementation FullScreenImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.imageViewMoviePoster setImage:self.imageMovieImage];

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.imageViewMoviePoster addGestureRecognizer:singleTap];
    [self.imageViewMoviePoster setUserInteractionEnabled:YES];
}

- (void)imageViewTapped:(id)imageViewTapped {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
