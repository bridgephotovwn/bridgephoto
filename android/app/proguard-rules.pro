# PDFBox-Android: optional JPEG2000 codec is not bundled
-dontwarn com.gemalto.jp2.JP2Decoder
-dontwarn com.gemalto.jp2.JP2Encoder
# PDFBox loads fonts/colour profiles by reflection and resource name
-keep class com.tom_roush.pdfbox.** { *; }
-keep class com.tom_roush.fontbox.** { *; }
-dontwarn com.tom_roush.**
