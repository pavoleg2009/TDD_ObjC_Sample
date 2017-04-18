//
//  ViewController.m
//  TDDSampleApp
//
//  Created by Oleg Pavlichenkov on 16/04/2017.
//  Copyright © 2017 Oleg Pavlichenkov. All rights reserved.
//

#import "ViewController.h"
#import "MarvelKeys.m"
#import	<CommonCrypto/CommonDigest.h>

@interface ViewController () <NSURLSessionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Concatinate keys per https://developer.marvel.com/documentation/authorization
    NSString *timeStamp = @"1"; // hard-coded for spike
    NSString *keys = [NSString stringWithFormat:@"%@%@%@",
                      timeStamp, MarvelPrivateKey, MarvelPublicKey];
    char const *keysString = [keys UTF8String];
    
    // Create MD5 digest
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(keysString, strlen(keysString), digest);
    // Convert digest to hex format
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSUInteger i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
        [hash appendFormat:@"%02x", digest[i]];
    
    // Manually confirm that it's 32 hex digits:
    //NSLog(@"%@", hash);
    
    // Manually confirm URL string:
    NSString *URLString = [NSString stringWithFormat:
                           @"http://gateway.marvel.com/v1/public/characters?nameStartsWith=Spider&ts=%@&apikey=%@&hash=%@",
                           timeStamp, MarvelPublicKey, hash];
    NSLog(@"%@", URLString);
    
    // Create Data Task
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig
                                                           delegate:self
                                                      delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:URLString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                      {
                                          NSLog(@"Data: %@", data);
                                          NSLog(@"Response: %@", response);
                                          NSLog(@"Error: %@", error);
                                      }];
    [dataTask resume];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
