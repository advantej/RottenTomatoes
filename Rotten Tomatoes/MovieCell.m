//
//  MovieCell.m
//  Rotten Tomatoes
//
//  Created by Tejas Lagvankar on 1/21/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindData:(NSDictionary *)movieDict {

    self.titleLabel.text = movieDict[@"title"];
    self.snippetLabel.text = movieDict[@"synopsis"];

    NSDictionary *postersDict = movieDict[@"posters"];
    NSString *urlString = postersDict[@"thumbnail"];
    //NSString *urlString = [movie valueForKey:@"posters.thumbnail"];
    NSURL *movieImageUrl = [NSURL URLWithString:urlString];
    [self.movieImage setImageWithURL:movieImageUrl];
}


@end
