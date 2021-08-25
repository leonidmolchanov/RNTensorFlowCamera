import { PropTypes } from "prop-types";
import React, { Component } from "react";
import {
    NativeModules,
    NativeEventEmitter,
    requireNativeComponent,
    ViewPropTypes,
    Platform,
    DeviceEventEmitter
} from "react-native";

const emitter = Platform.OS === 'ios' ? new NativeEventEmitter(NativeModules.ReactNativeEventEmitter) : DeviceEventEmitter

interface IProps{
    onData:(data:{
        confidence:number,
        label:string
    }[])=>void
}
let TF = requireNativeComponent('RNTensorFlowCamera', null);
const TFNative = NativeModules.RNTensorFlowCamera;
console.log(NativeModules)
const RNTensorFlowCamera: React.FunctionComponent<IProps>  = ({onData, style, ref})=>{

    const listener = emitter.addListener("RNTensorFlowCamera", (e)=>onData(JSON.parse(e)))


    return(
        <TF  style={style}/>
    )
}

export default RNTensorFlowCamera

export {TF, TFNative}
