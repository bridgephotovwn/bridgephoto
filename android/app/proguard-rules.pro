# PDFBox-Android: optional JPEG2000 codec is not bundled
-dontwarn com.gemalto.jp2.JP2Decoder
-dontwarn com.gemalto.jp2.JP2Encoder
# PDFBox loads fonts/colour profiles by reflection and resource name
-keep class com.tom_roush.pdfbox.** { *; }
-keep class com.tom_roush.fontbox.** { *; }
-dontwarn com.tom_roush.**

# Google ML Kit + Play services scanner: components are discovered by class
# name at start-up and the scanner AAR ships no keep rules of its own.
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.internal.mlkit_** { *; }
-keep class com.google.firebase.components.** { *; }
-keep class * implements com.google.firebase.components.ComponentRegistrar { *; }
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod
