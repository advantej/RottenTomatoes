//
//  MovieViewController.m
//  Rotten Tomatoes
//
//  Created by Tejas Lagvankar on 1/20/15.
//  Copyright (c) 2015 Yahoo!. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieCell.h"
#import "MovieDetailViewController.h"
#import "SVProgressHUD.h"

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *movies;
@property (strong, nonatomic) NSArray *moviesOriginal;

@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UILabel *networkErrorLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *movieSearchBar;


- (void)showNetworkErrorMessage;
- (void)hideNetworkErrorMessage;
- (void)restoreOriginalMovies;
- (void)performSearch: (NSString *) searchText;
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.title = @"Movies";
    
    [self hideNetworkErrorMessage];

    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];

    self.tableView.dataSource = self;
    self.tableView.rowHeight = 146;
    self.tableView.delegate = self;
    self.movieSearchBar.delegate = self;

    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];

    [self onRefresh];
}

- (void)onRefresh {
    self.movieSearchBar.text = @"";
    [self.movieSearchBar resignFirstResponder];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=dagqdghwaq3e3mxyrp7kmmj5&limit=20&country=us"]];
    [SVProgressHUD show];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if (connectionError != nil) {
            
            [self showNetworkErrorMessage];

            [self.refreshControl endRefreshing];
            [SVProgressHUD dismiss];
            return;
        }
        
        [self hideNetworkErrorMessage];
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.movies = object[@"movies"];
        self.moviesOriginal = self.movies;
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
        [SVProgressHUD dismiss];
    }];
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
    [movieCell bindData:self.movies[indexPath.row]];
    return movieCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailViewController *movieDetailViewController = [[MovieDetailViewController alloc] init];

    movieDetailViewController.movieDict = self.movies[indexPath.row];

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:movieDetailViewController animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@" Search string  : %@", searchBar.text);
    [searchBar resignFirstResponder];
    [self performSearch:searchBar.text];
}


- (void)showNetworkErrorMessage {
    [self.networkErrorLabel setHidden:NO];
    [self.movieSearchBar setHidden:YES];
}

- (void)hideNetworkErrorMessage {
    [self.networkErrorLabel setHidden:YES];
    [self.movieSearchBar setHidden:NO];
}

- (void)restoreOriginalMovies {
    self.movies = self.moviesOriginal;
    [self.tableView reloadData];
    [self.movieSearchBar resignFirstResponder];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.movieSearchBar resignFirstResponder];
}

- (void)performSearch:(NSString *)searchText {

    if (searchText.length == 0) {
        [self restoreOriginalMovies];
        return;
    }

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title contains[cd] %@", searchText];
    self.movies = [self.moviesOriginal filteredArrayUsingPredicate:predicate];
    [self.tableView reloadData];

}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text %ld", searchText.length);
    [self performSearch:searchText];
}


@end
