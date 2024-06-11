// MultitouchSupportCaller.m

#import <Foundation/Foundation.h>
#import "MultitouchSupport.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MultitouchSupport.framework"];
    // Call MTDeviceCreateList() To Get List Of Multitouchable Devices
        CFMutableArrayRef deviceList = MTDeviceCreateList();
        
    // Check If Creation Of List Successful
        if (deviceList != NULL) {
        // Get The Number Of Devices
            CFIndex deviceCount = CFArrayGetCount(deviceList);
            NSLog(@"Found %ld multitouch device(s).", deviceCount);
            
            // Do Something With The List…
            
            // Release The List
            CFRelease(deviceList);
        } else {
            NSLog(@"Failed to create the multitouch device list.");
        }
    }
    return 0;
}

