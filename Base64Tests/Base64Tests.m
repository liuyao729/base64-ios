//
//  Copyright (c) 2013, Benjamin Borbe
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are
//  met:
//
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above
//    copyright notice, this list of conditions and the following
//    disclaimer in the documentation and/or other materials provided
//    with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "Base64Tests.h"
#import "Base64.h"

@implementation Base64Tests

- (void)testEncode
{
    {
        NSData* data = nil;
        NSString* base64String  = [Base64 encode:data];
        STAssertNil(base64String, @"nil");
    }
    {
        NSData* data = [NSData alloc];
        NSString* base64String  = [Base64 encode:data];
        STAssertNotNil(base64String, @"not nil");
    }
    {
        unsigned char ch1[] = {
            0x00, 0x00, 0x00
        };
        NSData* data = [[NSData alloc] initWithBytes:ch1
                                              length:sizeof(ch1)];
        NSString* base64String  = [Base64 encode:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"AAAA", base64String, @"check string");
    }
    {
        unsigned char ch1[] = {
            0xFF, 0xFF, 0xFF
        };
        NSData* data = [[NSData alloc] initWithBytes:ch1
                                              length:sizeof(ch1)];
        NSString* base64String  = [Base64 encode:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"////", base64String, @"check string");
    }
    {
        unsigned char ch1[] = {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00
        };
        NSData* data = [[NSData alloc] initWithBytes:ch1
                                              length:sizeof(ch1)];
        NSString* base64String  = [Base64 encode:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"AAAAAAAA", base64String, @"check string");
    }
    {
        unsigned char ch1[] = {
            0x00, 0x00
        };
        NSData* data = [[NSData alloc] initWithBytes:ch1
                                              length:sizeof(ch1)];
        NSString* base64String  = [Base64 encode:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"AAA=", base64String, @"check string");
    }
    {
        unsigned char ch1[] = {
            0x00
        };
        NSData* data = [[NSData alloc] initWithBytes:ch1
                                              length:sizeof(ch1)];
        NSString* base64String  = [Base64 encode:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"AA==", base64String, @"check string");
    }
}

- (void)testEncodeString
{
    {
        NSString* data = nil;
        NSString* base64String  = [Base64 encodeString:data];
        STAssertNil(base64String, @"nil");
    }
    {
        NSString* data = @"";
        NSString* base64String  = [Base64 encodeString:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"", base64String, @"check string");
    }
    {
        NSString* data = @"pleasure.";
        NSString* base64String  = [Base64 encodeString:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"cGxlYXN1cmUu", base64String, @"check string");
    }
    {
        NSString* data = @"leasure.";
        NSString* base64String  = [Base64 encodeString:data];
        STAssertNotNil(base64String, @"not nil");
        STAssertEqualObjects(@"bGVhc3VyZS4=", base64String, @"check string");
    }
}

- (void)testDecode
{
    {
        NSString* base64String = nil;
        NSData* data  = [Base64 decode:base64String];
        STAssertNil(data, @"nil");
    }
    {
        NSString* base64String = @"";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
    }
    {
        unsigned char ch1[] = {};
        NSData* expectedData = [[NSData alloc] initWithBytes:ch1
                                                      length:sizeof(ch1)];
        NSString* base64String = @"";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expectedData, data, @"compare data");
    }
    {
        unsigned char ch1[] = {
            0x00, 0x00, 0x00
        };
        NSData* expectedData = [[NSData alloc] initWithBytes:ch1
                                                      length:sizeof(ch1)];
        NSString* base64String = @"AAAA";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expectedData, data, @"compare data");
    }
    {
        unsigned char ch1[] = {
            0xFF, 0xFF, 0xFF
        };
        NSData* expectedData = [[NSData alloc] initWithBytes:ch1
                                                      length:sizeof(ch1)];
        NSString* base64String = @"////";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expectedData, data, @"compare data");
    }
    {
        unsigned char ch1[] = {
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00
        };
        NSData* expectedData = [[NSData alloc] initWithBytes:ch1
                                                      length:sizeof(ch1)];
        NSString* base64String = @"AAAAAAAA";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expectedData, data, @"compare data");
    }
    {
        unsigned char ch1[] = {
            0x00
        };
        NSData* expectedData = [[NSData alloc] initWithBytes:ch1
                                                      length:sizeof(ch1)];
        NSString* base64String = @"AA==";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expectedData, data, @"compare data");
    }
    {
        unsigned char ch1[] = {
            0x00, 0x00
        };
        NSData* expectedData = [[NSData alloc] initWithBytes:ch1
                                                      length:sizeof(ch1)];
        NSString* base64String = @"AAA=";
        NSData* data  = [Base64 decode:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expectedData, data, @"compare data");
    }
}

- (void)testDecodeString
{
    {
        NSString* base64String = nil;
        NSString* data  = [Base64 decodeString:base64String];
        STAssertNil(data, @"nil");
    }
    {
        NSString* base64String = @"";
        NSString* data  = [Base64 decodeString:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(@"", data, @"check string");
    }
    {
        NSString* base64String = @"cGxlYXN1cmUu";
        NSString* expected =  @"pleasure.";
        NSString* data  = [Base64 decodeString:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expected, data, @"check string");
    }
    {
        NSString* base64String = @"bGVhc3VyZS4=";
        NSString* expected =  @"leasure.";
        NSString* data  = [Base64 decodeString:base64String];
        STAssertNotNil(data, @"not nil");
        STAssertEqualObjects(expected, data, @"check string");
    }
}

@end
