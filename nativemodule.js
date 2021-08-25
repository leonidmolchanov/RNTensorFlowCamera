import { NativeModules, NativeEventEmitter } from "react-native";
const tenserFlowCamera_native = NativeModules.tenserFlowCamera;

const tenserFlowCamera = {
  nativeObj: tenserFlowCamera_native,
  a: tenserFlowCamera_native.a,
  b: tenserFlowCamera_native.b,
  startTime: tenserFlowCamera_native.startTime,
  addListener: cb => {
    const e = new NativeEventEmitter(tenserFlowCamera_native);
    const s = e.addListener("tenserFlowCamera", cb);
    return s;
  },
  addListenerDemo: () => {
    tenserFlowCamera.addListener(arr => {
      console.log("Received a tenserFlowCamera event", arr.message);
    });
  },
  emitMessage: async (message, delayms) => {
    if (!delayms) delayms = 0;
    return await tenserFlowCamera_native.delayedSend(message, delayms);
  },
  demoWithPromise: async message => {
    //Returns a promise!
    const output = await tenserFlowCamera_native.demo(message);
    return output;
  }
};

export default tenserFlowCamera;
