//  OCMockito by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2017 Jonathan M. Reid. See LICENSE.txt

#import "MKTUnsignedLongLongReturnSetter.h"


@implementation MKTUnsignedLongLongReturnSetter

- (instancetype)initWithSuccessor:(nullable MKTReturnValueSetter *)successor
{
    self = [super initWithType:@encode(unsigned long long) successor:successor];
    return self;
}

- (void)setReturnValue:(id)returnValue onInvocation:(NSInvocation *)invocation
{
    unsigned long long value = [returnValue unsignedLongLongValue];
    [invocation setReturnValue:&value];
}

@end
