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
let TF = requireNativeComponent('TFImageClassification', null);
const TFNative = NativeModules.TFImageClassification;
console.log(NativeModules)
const TFImageClassification: React.FunctionComponent<IProps>  = ({onData, style, ref})=>{

    const listener = emitter.addListener("TFImageClassification", (e)=>onData(JSON.parse(e)))


    return(
        <TF  style={style}/>
    )
}

export default TFImageClassification

export {TF, TFNative}
