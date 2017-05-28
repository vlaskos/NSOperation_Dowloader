# NSOperationDowloader

* [Demo](#demo)
* [Usage example](#usage-example)

Library for downloading data using NSOpearation. 

# Demo

![](https://github.com/vlaskos/NSOperation_Dowloader/blob/master/example.gif)

# Usage example

- Initialization 

@property (nonatomic, strong) VKDownloadManager *downloader;

[downloader downloadWithURL:url
            withCompletion:^(NSData *data, NSURLResponse *response, NSError *error) {
            
                self.customImageView.image = [UIImage imageWithData:data];
                NSLog(@"downloaded");
}];

- You can use some methods for manipulation with the session: 

// stop sessions
- (void) stop;
- (void) stopAll; 

// for checking session state
- (BOOL) isFinished; 
- (BOOL) isExecuting;

Developed By
------------
* Kosyi Vlad
