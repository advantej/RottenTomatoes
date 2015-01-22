//
//  MovieViewController.m
//  Rotten Tomatoes
//
//  Created by Tejas Lagvankar on 1/20/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *movies;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Movies";

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.movies = object[@"movies"];
        [self.tableView reloadData];
    }];

    self.tableView.dataSource = self;
    self.tableView.rowHeight = 146;

    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];

    NSDictionary *movie = self.movies[indexPath.row];

    movieCell.titleLabel.text = movie[@"title"];
    movieCell.snippetLabel.text = movie[@"synopsis"];

    NSDictionary *postersDict = movie[@"posters"];
    NSString *urlString = postersDict[@"thumbnail"];
    //NSString *urlString = [movie valueForKey:@"posters.thumbnail"];
    NSURL *movieImageUrl = [NSURL URLWithString:urlString];
    [movieCell.movieImage setImageWithURL:movieImageUrl];

    return movieCell;
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
