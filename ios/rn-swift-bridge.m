
#import "React/RCTViewManager.h"
#import "RCTBridgeModule.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(RNTensorFlowCamera, RCTViewManager)
RCT_EXTERN_METHOD(onData:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(startCapture:(NSString *)module_value:(NSString *)module_label )
RCT_EXTERN_METHOD(stopCapture)
RCT_EXTERN_METHOD(togglePosition)


@end


@interface RCT_EXTERN_MODULE(ReactNativeEventEmitter, RCTEventEmitter)


- (NSArray<NSString *> *)supportedEvents {
  return @[@"RNTensorFlowCamera"];
}
@end
