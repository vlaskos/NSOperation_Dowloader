# NSOperationDowloader

* [Demo](#demo)
* [Usage example](#usage-example)

A library for downloading data using NSOpearation. 

# Demo

![](https://github.com/vlaskos/NSOperation_Dowloader/blob/master/example.gif)

# Usage example

- Initialization 

Clone NSOperationDownloader folder into your project.

#import "VKDownloadManager.h"

@property (nonatomic, strong) VKDownloadManager *downloader;

[downloader downloadWithURL:url
            withCompletion:^(NSData *data, NSURLResponse *response, NSError *error) {
            
                self.customImageView.image = [UIImage imageWithData:data];
                NSLog(@"downloaded");
}];

- You can use methods below for manipulation with the session: 

// stop sessions
- (void) stop;
- (void) stopAll; 

// for checking session state
- (BOOL) isFinished; 
- (BOOL) isExecuting;

Also, you can run the test project "downloader".

Developed By
------------
* Kosyi Vlad
