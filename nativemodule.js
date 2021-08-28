import { NativeModules, NativeEventEmitter } from "react-native";
const tenserFlowCamera_native = NativeModules.RNTensorFlowCamera;

const tenserFlowCamera = {
  startCapture: () => {
    return tenserFlowCamera_native.startCapture();
  },
  stopCapture: () => {
    return tenserFlowCamera_native.stopCapture();
  },
};

export default tenserFlowCamera;
