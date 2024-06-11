// MultitouchSupportCaller.m

#import <Foundation/Foundation.h>
#import "MultitouchSupport.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    // Call MTDeviceCreateList() To Get List Of Multitouchable Devices
        CFMutableArrayRef deviceList = MTDeviceCreateList();
        
    // Check If Creation Of List Successful
        if (deviceList != NULL) {
        // Get The Number Of Devices
            CFIndex deviceCount = CFArrayGetCount(deviceList);
            printf("Found %ld multitouch device(s).", deviceCount);
            
            // Do Something With The List…
            
            // Release The List
            CFRelease(deviceList);
        } else {
            printf("Failed to create the multitouch device list.");
        }
    }
    return 0;
}

