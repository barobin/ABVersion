//
//  ABVersion.m
//  ABVersion
//
//  Created by Alexander Barobin
//  Copyright © 2018 Alexander Barobin. All rights reserved.
//

#import "ABVersion.h"

#pragma mark ABVersion
@interface ABVersion ()
@property (assign, nonatomic) long long majorVersion;
@property (assign, nonatomic) long long minorVersion;
@property (assign, nonatomic) long long patchVersion;

@end

@implementation ABVersion

#pragma mark Public

- (instancetype)initWithVersionString:(NSString *)versionString
{
    if (!versionString || [versionString length] == 0) {
        return nil;
    }
    
    if (self = [super init]) {
        NSScanner *scanner = [NSScanner scannerWithString:versionString];
        unsigned long long majorVersion = 0, minorVersion = 0, patchVersion = 0;
        if ([scanner scanUnsignedLongLong:&majorVersion]) {
            if (![scanner isAtEnd] && [scanner scanString:@"." intoString:nil]) {
                if ([scanner scanUnsignedLongLong:&minorVersion]) {
                    if (![scanner isAtEnd] && [scanner scanString:@"." intoString:nil]) {
                        [scanner scanUnsignedLongLong:&patchVersion];
                    }
                }
            }
        }
        
        _majorVersion = majorVersion;
        _minorVersion = minorVersion;
        _patchVersion = patchVersion;
        
        if (_patchVersion == 0) {
            _formatted = [NSString stringWithFormat:@"%lld.%lld", _majorVersion, _minorVersion];
        }
        else {
            _formatted = [NSString stringWithFormat:@"%lld.%lld.%lld", _majorVersion, _minorVersion, _patchVersion];
        }
        
    }
    
    return self;
}

+ (instancetype)versionWithString:(NSString *)versionString
{
    return [[self alloc] initWithVersionString:versionString];
}

- (BOOL)isGreatThanVersion:(ABVersion *)version
{
    if (self == version) {
        return NO;
    }
    
    if (self.majorVersion > version.majorVersion) {
        return YES;
    }
    else if (self.majorVersion < version.majorVersion) {
        return NO;
    }
    
    if (self.minorVersion > version.minorVersion) {
        return YES;
    }
    else if (self.minorVersion < version.minorVersion) {
        return NO;
    }
    
    if (self.patchVersion > version.patchVersion) {
        return YES;
    }
    else if (self.patchVersion < version.patchVersion) {
        return NO;
    }
    
    return NO;
}

- (BOOL)isGreatOrEqualThanVersion:(ABVersion *)version
{
    return [self isGreatThanVersion:version] || [self isEqualToVersion:version];
}

- (BOOL)isEqualToVersion:(ABVersion *)version
{
    if (self == version) {
        return YES;
    }
    
    if (self.majorVersion != version.majorVersion) {
        return NO;
    }
    
    if (self.minorVersion != version.minorVersion) {
        return NO;
    }
    
    if (self.patchVersion != version.patchVersion) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isLessThanVersion:(ABVersion *)version
{
    return ![self isGreatOrEqualThanVersion:version];
}

- (BOOL)isLessOrEqualThanVersion:(ABVersion *)version
{
    return ![self isGreatThanVersion:version] || [self isEqualToVersion:version];
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    ABVersion *result = [[[self class] allocWithZone:zone] init];
    result.majorVersion = _majorVersion;
    result.minorVersion = _minorVersion;
    result.patchVersion = _patchVersion;
    
    return result;
}

@end

#pragma mark - ABVersion (UIApplication)
@implementation ABVersion (UIApplication)

+ (ABVersion *)applicationVersion
{
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return [self versionWithString:bundleVersion];
}

+ (ABVersion *)systemVersion
{
    return [self versionWithString:[UIDevice currentDevice].systemVersion];
}

@end
