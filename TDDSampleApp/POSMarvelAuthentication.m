//
//  POSMarvelAuthentication.m
//  TDDSampleApp
//
//  Created by Oleg Pavlichenkov on 18/04/2017.
//  Copyright © 2017 Oleg Pavlichenkov. All rights reserved.
//

#import "POSMarvelAuthentication.h"
#import "MarvelKeys.m"

@implementation POSMarvelAuthentication

+ (NSString *)timestamp {
    return @([[NSDate date] timeIntervalSinceReferenceDate]).stringValue;
}

+ (NSString *)publicKey {
    return MarvelPublicKey;
}

+ (NSString *)privateKey {
    return MarvelPrivateKey;
}

@end
