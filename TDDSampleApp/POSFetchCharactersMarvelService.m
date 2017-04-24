//
// Created by Oleg Pavlichenkov on 24/04/2017.
// Copyright (c) 2017 Oleg Pavlichenkov. All rights reserved.
//

#import "POSFetchCharactersMarvelService.h"
#import "POSFetchCharactersRequestModel.h"

@interface POSFetchCharactersMarvelService()

@property (nonatomic, strong, readonly) NSURLSession *session;
//@property (nonatomic, copy, readonly) NSString *(^authParametersGenerator)();

@end

@implementation POSFetchCharactersMarvelService {

}
- (instancetype)initWithSession:(NSURLSession *)session
//     andAuthParameterGenerators:(NSString *(^)())authParametersGenerator
{

    self = [super init];
    if (self) {
        _session = session;
//        _authParametersGenerator = authParametersGenerator;
    }
    return self;
}

- (void)fetchCaractersWithRequestModel:(POSFetchCharactersRequestModel *)requestModel
{
    NSURL *url = [self URLForRequestModel:requestModel];
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                                 {
                                                     NSLog(@"Error: %@", error);
                                                     NSLog(@"Response: %@", response);
                                                     NSLog(@"Data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                                 }];
    [dataTask resume];
}

- (NSURL *)URLForRequestModel:(POSFetchCharactersRequestModel *)requestModel {

    NSString *encodedNamedPrefix = [requestModel.namePrefix stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:@"https://gateway.marvel.com/v1/public/characters?nameStartsWith=%@&limit=%lu&offset=%lu",
                                                     encodedNamedPrefix, (unsigned long) requestModel.pageSize, (unsigned long) requestModel.offset];
    return [[NSURL alloc] initWithString:urlString];
}


@end