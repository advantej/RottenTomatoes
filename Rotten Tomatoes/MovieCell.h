//
//  MovieCell.h
//  Rotten Tomatoes
//
//  Created by Tejas Lagvankar on 1/21/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *snippetLabel;

- (void) bindData:(NSDictionary *) movieDict;

@end
