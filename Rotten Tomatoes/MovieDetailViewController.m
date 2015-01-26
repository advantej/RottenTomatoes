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
@property (weak, nonatomic) IBOutlet UIScrollView *movieDetailScrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UILabel *labelRatings;
@property (weak, nonatomic) IBOutlet UILabel *labelMovieTitle;
@property (weak, nonatomic) IBOutlet UIView *movieInfoContainer;
@property (weak, nonatomic) IBOutlet UITextView *textViewDetails;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movieDetailScrollView.contentSize = CGSizeMake(320, 400);

    self.labelMovieTitle.text = self.movieDict[@"title"];
    
    NSDictionary *ratingsDict = self.movieDict[@"ratings"];
    
    self.labelRatings.text  = [NSString stringWithFormat:@"Critics : %@    Users : %@", ratingsDict[@"critics_rating"], ratingsDict[@"audience_rating"]];
    self.labelScore.text  = [NSString stringWithFormat:@"Critics : %@    Users : %@", ratingsDict[@"critics_score"], ratingsDict[@"audience_score"]];

    
    self.textViewDetails.text = self.movieDict[@"synopsis"];
    
//    CGSize foo = [self.movieDetail sizeThatFits:CGSizeMake(320, 200)];
//    self.movieDetail.frame = CGRectMake(self.movieDetail.frame.origin.x, self.movieDetail.frame.origin.y, foo.width, foo.height);
    
//    [self.movieDetail sizeToFit];
//    [self.movieInfoContainer sizeToFit];

    NSString *urlString = [self.movieDict valueForKeyPath:@"posters.thumbnail"];
    urlString = [urlString stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
    [self.moviePoster setImageWithURL:[NSURL URLWithString:urlString]];

}

//- (void)setUILabelTextWithVerticalAlignTop:(NSString *)theText {
//    CGSize labelSize = CGSizeMake(300, 500);
//    CGSize theStringSize = [theText sizeWithFont:self.movieDetail.font constrainedToSize:labelSize lineBreakMode:self.movieDetail.lineBreakMode];
//    self.movieDetail.frame = CGRectMake(self.movieDetail.frame.origin.x, self.movieDetail.frame.origin.y, theStringSize.width, theStringSize.height);
//    self.movieDetail.text = theText;
//}

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
