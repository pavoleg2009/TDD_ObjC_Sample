//
// Created by Oleg Pavlichenkov on 21/04/2017.
// Copyright (c) 2017 Oleg Pavlichenkov. All rights reserved.
//

#import "POSFetchCharactersRequestModel.h"


@implementation POSFetchCharactersRequestModel {

}
- (instancetype)initWithNamePrefix:(NSString *)namePrefix
                          pageSize:(NSUInteger)pageSize
                            offset:(NSUInteger)offset {
    self = [super init];
    if (self) {
        _namePrefix = [namePrefix copy];
        _pageSize = pageSize;
        _offset = offset;
    }

    return self;
}

@end