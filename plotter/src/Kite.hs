{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Kite (protoInfo, fileDescriptorProto) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import Text.DescriptorProtos.FileDescriptorProto (FileDescriptorProto)
import Text.ProtocolBuffers.Reflections (ProtoInfo)
import qualified Text.ProtocolBuffers.WireMessage as P' (wireGet,getFromBS)
 
protoInfo :: ProtoInfo
protoInfo
 = Prelude'.read
    "ProtoInfo {protoMod = ProtoName {protobufName = FIName \".kite\", haskellPrefix = [], parentModule = [], baseName = MName \"Kite\"}, protoFilePath = [\"Kite.hs\"], protoSource = \"kite.proto\", extensionKeys = fromList [], messages = [DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.Xyz\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"Xyz\"}, descFilePath = [\"Kite\",\"Xyz.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Xyz.x\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Xyz\"], baseName' = FName \"x\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Xyz.y\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Xyz\"], baseName' = FName \"y\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Xyz.z\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Xyz\"], baseName' = FName \"z\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.Dcm\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"Dcm\"}, descFilePath = [\"Kite\",\"Dcm.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r11\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r11\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r12\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r12\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r13\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r13\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r21\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r21\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r22\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r22\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 41}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r23\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r23\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r31\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r31\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 57}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r32\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r32\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 65}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.Dcm.r33\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"Dcm\"], baseName' = FName \"r33\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 73}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.CarouselState\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"CarouselState\"}, descFilePath = [\"Kite\",\"CarouselState.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.kiteXyz\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"kiteXyz\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".kite.Xyz\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"Xyz\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.kiteDcm\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"kiteDcm\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".kite.Dcm\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"Dcm\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.delta\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"delta\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.rArm\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"rArm\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.zt\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"zt\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 41}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.messages\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"messages\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.w0\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"w0\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 57}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.kiteTransparency\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"kiteTransparency\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 65}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.lineTransparency\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"lineTransparency\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 73}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.CarouselState.outputs\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"CarouselState\"], baseName' = FName \"outputs\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 82}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".kite.KiteOutputs\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"KiteOutputs\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.KiteOutputs\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"KiteOutputs\"}, descFilePath = [\"Kite\",\"KiteOutputs.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.CL\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"cL\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.CD\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"cD\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.L_over_D\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"l_over_D\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 25}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.alpha_deg\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"alpha_deg\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 33}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.beta_deg\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"beta_deg\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 41}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.airspeed\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"airspeed\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 49}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.tension\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"tension\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 57}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.power\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"power\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 65}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.energy\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"energy\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 73}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.line_angle_deg\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"line_angle_deg\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 81}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.r\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"r\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 89}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.dr\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"dr\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 97}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.KiteOutputs.ddr\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"KiteOutputs\"], baseName' = FName \"ddr\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 105}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.PendulumOpt\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"PendulumOpt\"}, descFilePath = [\"Kite\",\"PendulumOpt.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.PendulumOpt.x\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"PendulumOpt\"], baseName' = FName \"x\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Just (WireTag {getWireTag = 9},WireTag {getWireTag = 10}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.PendulumOpt.z\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"PendulumOpt\"], baseName' = FName \"z\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 17}, packedTag = Just (WireTag {getWireTag = 17},WireTag {getWireTag = 18}), wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.PendulumOpt.messages\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"PendulumOpt\"], baseName' = FName \"messages\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.MultiCarousel\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"MultiCarousel\"}, descFilePath = [\"Kite\",\"MultiCarousel.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.MultiCarousel.css\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"MultiCarousel\"], baseName' = FName \"css\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".kite.CarouselState\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"CarouselState\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.MultiCarousel.messages\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"MultiCarousel\"], baseName' = FName \"messages\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False},DescriptorInfo {descName = ProtoName {protobufName = FIName \".kite.TestMessages\", haskellPrefix = [], parentModule = [MName \"Kite\"], baseName = MName \"TestMessages\"}, descFilePath = [\"Kite\",\"TestMessages.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_double\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_double\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 9}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_float\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_float\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 21}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 2}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_int32\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_int32\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 5}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_int64\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_int64\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 3}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_uint32\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_uint32\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_uint64\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_uint64\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 4}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_sint32\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_sint32\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 17}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_sint64\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_sint64\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 18}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_fixed32\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_fixed32\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 77}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 7}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_fixed64\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_fixed64\"}, fieldNumber = FieldId {getFieldId = 10}, wireTag = WireTag {getWireTag = 81}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 6}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_sfixed32\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_sfixed32\"}, fieldNumber = FieldId {getFieldId = 11}, wireTag = WireTag {getWireTag = 93}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 15}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_sfixed64\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_sfixed64\"}, fieldNumber = FieldId {getFieldId = 12}, wireTag = WireTag {getWireTag = 97}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 16}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_bool\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_bool\"}, fieldNumber = FieldId {getFieldId = 13}, wireTag = WireTag {getWireTag = 104}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 8}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_string\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_string\"}, fieldNumber = FieldId {getFieldId = 14}, wireTag = WireTag {getWireTag = 114}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 9}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_bytes\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_bytes\"}, fieldNumber = FieldId {getFieldId = 15}, wireTag = WireTag {getWireTag = 122}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_maybeDouble\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_maybeDouble\"}, fieldNumber = FieldId {getFieldId = 16}, wireTag = WireTag {getWireTag = 129}, packedTag = Nothing, wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".kite.TestMessages.a_repeatedDouble\", haskellPrefix' = [], parentModule' = [MName \"Kite\",MName \"TestMessages\"], baseName' = FName \"a_repeatedDouble\"}, fieldNumber = FieldId {getFieldId = 17}, wireTag = WireTag {getWireTag = 137}, packedTag = Just (WireTag {getWireTag = 137},WireTag {getWireTag = 138}), wireTagLength = 2, isPacked = False, isRequired = False, canRepeat = True, mightPack = True, typeCode = FieldType {getFieldType = 1}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}], enums = [], knownKeyMap = fromList []}"
 
fileDescriptorProto :: FileDescriptorProto
fileDescriptorProto
 = P'.getFromBS (P'.wireGet 11)
    (P'.pack
      "\200\b\n\nkite.proto\DC2\EOTkite\"&\n\ETXXyz\DC2\t\n\SOHx\CAN\SOH \STX(\SOH\DC2\t\n\SOHy\CAN\STX \STX(\SOH\DC2\t\n\SOHz\CAN\ETX \STX(\SOH\"z\n\ETXDcm\DC2\v\n\ETXr11\CAN\SOH \STX(\SOH\DC2\v\n\ETXr12\CAN\STX \STX(\SOH\DC2\v\n\ETXr13\CAN\ETX \STX(\SOH\DC2\v\n\ETXr21\CAN\EOT \STX(\SOH\DC2\v\n\ETXr22\CAN\ENQ \STX(\SOH\DC2\v\n\ETXr23\CAN\ACK \STX(\SOH\DC2\v\n\ETXr31\CAN\a \STX(\SOH\DC2\v\n\ETXr32\CAN\b \STX(\SOH\DC2\v\n\ETXr33\CAN\t \STX(\SOH\"\230\SOH\n\rCarouselState\DC2\SUB\n\akiteXyz\CAN\SOH \STX(\v2\t.kite.Xyz\DC2\SUB\n\akiteDcm\CAN\STX \STX(\v2\t.kite.Dcm\DC2\r\n\ENQdelta\CAN\ETX \STX(\SOH\DC2\f\n\EOTrArm\CAN\EOT \STX(\SOH\DC2\n\n\STXzt\CAN\ENQ \STX(\SOH\DC2\DLE\n\bmessages\CAN\ACK \ETX(\t\DC2\n\n\STXw0\CAN\a \SOH(\SOH\DC2\CAN\n\DLEkiteTransparency\CAN\b \SOH(\SOH\DC2\CAN\n\DLElineTransparency\CAN\t \SOH(\SOH\DC2\"\n\aoutputs\CAN\n \SOH(\v2\DC1.kite.KiteOutputs\"\218\SOH\n\vKiteOutputs\DC2\n\n\STXCL\CAN\SOH \STX(\SOH\DC2\n\n\STXCD\CAN\STX \STX(\SOH\DC2\DLE\n\bL_over_D\CAN\ETX \STX(\SOH\DC2\DC1\n\talpha_deg\CAN\EOT \STX(\SOH\DC2\DLE\n\bbeta_deg\CAN\ENQ \STX(\SOH\DC2\DLE\n\bairspeed\CAN\ACK \STX(\SOH\DC2\SI\n\atension\CAN\a \SOH(\SOH\DC2\r\n\ENQpower\CAN\b \SOH(\SOH\DC2\SO\n\ACKenergy\CAN\t \SOH(\SOH\DC2\SYN\n\SOline_angle_deg\CAN\n \STX(\SOH\DC2\t\n\SOHr\CAN\v \STX(\SOH\DC2\n\n\STXdr\CAN\f \STX(\SOH\DC2\v\n\ETXddr\CAN\r \SOH(\SOH\"5\n\vPendulumOpt\DC2\t\n\SOHx\CAN\SOH \ETX(\SOH\DC2\t\n\SOHz\CAN\STX \ETX(\SOH\DC2\DLE\n\bmessages\CAN\ETX \ETX(\t\"C\n\rMultiCarousel\DC2 \n\ETXcss\CAN\SOH \ETX(\v2\DC3.kite.CarouselState\DC2\DLE\n\bmessages\CAN\STX \ETX(\t\"\205\STX\n\fTestMessages\DC2\DLE\n\ba_double\CAN\SOH \STX(\SOH\DC2\SI\n\aa_float\CAN\STX \STX(\STX\DC2\SI\n\aa_int32\CAN\ETX \STX(\ENQ\DC2\SI\n\aa_int64\CAN\EOT \STX(\ETX\DC2\DLE\n\ba_uint32\CAN\ENQ \STX(\r\DC2\DLE\n\ba_uint64\CAN\ACK \STX(\EOT\DC2\DLE\n\ba_sint32\CAN\a \STX(\DC1\DC2\DLE\n\ba_sint64\CAN\b \STX(\DC2\DC2\DC1\n\ta_fixed32\CAN\t \STX(\a\DC2\DC1\n\ta_fixed64\CAN\n \STX(\ACK\DC2\DC2\n\na_sfixed32\CAN\v \STX(\SI\DC2\DC2\n\na_sfixed64\CAN\f \STX(\DLE\DC2\SO\n\ACKa_bool\CAN\r \STX(\b\DC2\DLE\n\ba_string\CAN\SO \STX(\t\DC2\SI\n\aa_bytes\CAN\SI \STX(\f\DC2\NAK\n\ra_maybeDouble\CAN\DLE \SOH(\SOH\DC2\CAN\n\DLEa_repeatedDouble\CAN\DC1 \ETX(\SOH")