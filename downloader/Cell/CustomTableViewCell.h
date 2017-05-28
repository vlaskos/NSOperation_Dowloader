//
//  CustomTableViewCell.h
//  downloader
//
//  Created by Vlad on 3/28/17.
//  Copyright © 2017 Vlad_Kosyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKDownloadManager;

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *customImageView;

- (void) configurateCellWithUrl:(NSURL*) url withDownloader:(VKDownloadManager*) downloader;

@end
