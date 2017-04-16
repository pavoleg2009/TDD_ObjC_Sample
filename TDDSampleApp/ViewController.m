//
//  ViewController.m
//  TDDSampleApp
//
//  Created by Oleg Pavlichenkov on 16/04/2017.
//  Copyright © 2017 Oleg Pavlichenkov. All rights reserved.
//

#import "ViewController.h"
#import "MarvelKeys.m"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Concatinate keys per https://developer.marvel.com/documentation/authorization
    NSString *timeStamp = @"1"; // hard-coded for spike
    NSString *keys = [NSString stringWithFormat:@"%@%@%@",
                      timeStamp, MarvelPrivateKey, MarvelPublicKey];
    char const *keysString = [keys UTF8String];
    
    //Confirm manuall
    NSLog(@"%s", keysString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
