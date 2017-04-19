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

//+ (NSString *)timestamp {
//    return @([[NSDate date] timeIntervalSinceReferenceDate]).stringValue;
//}

//- (NSString *)timestamp {
//    return @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
//}

- (NSString *)timestamp {
    if (!_timestamp) {
        _timestamp = @([NSDate date].timeIntervalSinceReferenceDate).stringValue;
    }
    return _timestamp;
    
}

- (NSString *)publicKey {
    if(!_publicKey)
        _publicKey = MarvelPublicKey;
    return _publicKey;
}

- (NSString *)privateKey {
    if (!_privateKey)
        _privateKey = MarvelPrivateKey;
    return _privateKey;
}

- (NSString *) timestampedKeys {
    return [NSString stringWithFormat:@"%@%@%@", self.timestamp, self.privateKey, self.publicKey];
}

//- (NSString *)MD5OfString:(NSString *)str {
//    const char *cstr = [str UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(cstr, strlen(cstr), digest);
//    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
//            digest[0], digest[1], digest[2], digest[3],
//            digest[4], digest[5], digest[6], digest[7],
//            digest[8], digest[9], digest[10], digest[11],
//            digest[12], digest[13], digest[14], digest[15]
//            ];
//}

- (NSString *)URLParameters {
    
    return [NSString stringWithFormat:@"&ts=%@&apikey=%@&hash=%@",
            self.timestamp, self.publicKey, self.calculateMD5([self timestampedKeys])];
}

- (NSString *(^)(NSString *))calculateMD5 {
    if (!_calculateMD5) {
        _calculateMD5 = ^(NSString *str) {
            const char *cstr = [str UTF8String];
            unsigned char digest[CC_MD5_DIGEST_LENGTH];
            CC_MD5(cstr, strlen(cstr), digest);
            return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                    digest[0], digest[1], digest[2], digest[3],
                    digest[4], digest[5], digest[6], digest[7],
                    digest[8], digest[9], digest[10], digest[11],
                    digest[12], digest[13], digest[14], digest[15]
                    ];
        };
    }
    
    return _calculateMD5;
}

@end
