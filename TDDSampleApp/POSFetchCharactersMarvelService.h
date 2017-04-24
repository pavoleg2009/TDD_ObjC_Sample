//
// Created by Oleg Pavlichenkov on 24/04/2017.
// Copyright (c) 2017 Oleg Pavlichenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class POSFetchCharactersRequestModel;


@interface POSFetchCharactersMarvelService : NSObject

@property(nonatomic, strong, readonly) NSURLSessionDataTask *dataTask;

- (instancetype)initWithSession:(NSURLSession *)session;
     // andAuthParameterGenerators:(NSString *(^)())authParametersGenerator;
- (void)fetchCaractersWithRequestModel:(POSFetchCharactersRequestModel *)requestModel;

@end