#include <stdio.h>
#include <dlfcn.h>
#include <Foundation/Foundation.h>

typedef void* (*MTDeviceCreateList_t)(void);

int main(int argc, const char * argv[]) {
// Load the MultitouchSupport-Framework
    void* handle = dlopen("/System/Library/PrivateFrameworks/MultitouchSupport.framework/MultitouchSupport", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "Failed to load MultitouchSupport framework\n");
        return 1;
    }

// Load The MTDeviceCreateList-Function
    MTDeviceCreateList_t MTDeviceCreateList = (MTDeviceCreateList_t)dlsym(handle, "MTDeviceCreateList");
    if (!MTDeviceCreateList) {
        fprintf(stderr, "Failed to get MTDeviceCreateList function\n");
        dlclose(handle);
        return 1;
    }

    // Call the MTDeviceCreateList function
    NSMutableArray* deviceList = (__bridge NSMutableArray*) MTDeviceCreateList();
    if (deviceList) {
        printf("Device Count: %lu\n", (unsigned long) [deviceList count]);
    } else {
        printf("Failed to create device list\n");
    }

    // Close the MultitouchSupport framework
    dlclose(handle);
    return 0;
}

