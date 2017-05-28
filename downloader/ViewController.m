//
//  ViewController.m
//  downloader
//
//  Created by Vlad on 3/17/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import "ViewController.h"
#import "VKDownloadManager.h"
#import "CustomTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) VKDownloadManager *downloader;

@property (strong) NSInvocationOperation *inOper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.downloader = [[VKDownloadManager alloc] init];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell configurateCellWithUrl:[NSURL URLWithString:@"https://pbs.twimg.com/profile_images/700456099166625793/VtOIDsIe.jpg"]
                  withDownloader:self.downloader];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




@end
