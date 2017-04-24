//
// Created by Oleg Pavlichenkov on 21/04/2017.
// Copyright (c) 2017 Oleg Pavlichenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface POSFetchCharactersRequestModel : NSObject

@property(nonatomic, copy, readonly) NSString *namePrefix;
@property(nonatomic, assign, readonly) NSUInteger *pageSize;
@property(nonatomic, assign, readonly) NSUInteger *offset;

- (instancetype)initWithNamePrefix:(NSString *)namePrefix
                          pageSize:(NSUInteger)pageSize
                            offset:(NSUInteger)offset;

@end