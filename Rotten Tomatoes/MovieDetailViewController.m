//
//  MovieDetailViewController.m
//  Rotten Tomatoes
//
//  Created by Tejas Lagvankar on 1/22/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UILabel *movieDetail;
@property (weak, nonatomic) IBOutlet UIScrollView *movieDetailScrollView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieDetailScrollView.contentSize = CGSizeMake(320, 1000);

    self.title = self.movieDict[@"title"];

    self.movieDetail.text = self.movieDict[@"synopsis"];
//    CGSize foo = [self.movieDetail sizeThatFits:CGSizeMake(320, 200)];
//    self.movieDetail.frame = CGRectMake(self.movieDetail.frame.origin.x, self.movieDetail.frame.origin.y, foo.width, foo.height);
    [self.movieDetail sizeToFit];

    NSString *urlString = [self.movieDict valueForKeyPath:@"posters.thumbnail"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
    [self.moviePoster setImageWithURL:[NSURL URLWithString:urlString]];

}

- (void)setUILabelTextWithVerticalAlignTop:(NSString *)theText {
    CGSize labelSize = CGSizeMake(300, 500);
    CGSize theStringSize = [theText sizeWithFont:self.movieDetail.font constrainedToSize:labelSize lineBreakMode:self.movieDetail.lineBreakMode];
    self.movieDetail.frame = CGRectMake(self.movieDetail.frame.origin.x, self.movieDetail.frame.origin.y, theStringSize.width, theStringSize.height);
    self.movieDetail.text = theText;
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
