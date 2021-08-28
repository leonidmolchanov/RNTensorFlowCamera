import React, {useEffect} from "react";
import {
    NativeModules,
    NativeEventEmitter,
    requireNativeComponent,
    ViewPropTypes,
    Platform,
    DeviceEventEmitter
} from "react-native";


interface IProps{
    onData:(data:{
        confidence:number,
        label:string
    }[])=>void
}
let TF = requireNativeComponent('RNTensorFlowCamera', null);

const RNTensorFlowCamera: React.FunctionComponent<IProps>  = ({onData, style, ref})=>{

    useEffect(()=>{
        const emitter = Platform.OS === 'ios' ? new NativeEventEmitter(NativeModules.ReactNativeEventEmitter) : DeviceEventEmitter
        const listener = emitter.addListener("RNTensorFlowCamera", (e)=>onData(JSON.parse(e)))
    },[])

    return(
        <TF  style={style}/>
    )
}

export default RNTensorFlowCamera

