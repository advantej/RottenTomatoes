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

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.movieDict[@"title"];

    self.movieDetail.text = self.movieDict[@"synopsis"];
    NSString *urlString = [self.movieDict valueForKeyPath:@"posters.thumbnail"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
    [self.moviePoster setImageWithURL:[NSURL URLWithString:urlString]];

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
