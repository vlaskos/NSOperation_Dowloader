//
//  CustomTableViewCell.m
//  downloader
//
//  Created by Vlad on 3/28/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "VKDownloadManager.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configurateCellWithUrl:(NSURL*) url withDownloader:(VKDownloadManager *)downloader{
    
    [downloader downloadWithURL:url
                withCompletion:^(NSData *data, NSURLResponse *response, NSError *error) {

                    self.customImageView.image = [UIImage imageWithData:data];
                    NSLog(@"downloaded");
    }];
}


@end
