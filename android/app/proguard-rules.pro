# ============================================================
# Flutter / Dart
# ============================================================
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.**

# ============================================================
# AndroidX WorkManager + Room (WorkDatabase is a Room DB
# instantiated reflectively by WorkManager - R8 removes it
# without these rules, causing the startup crash).
# ============================================================
-keep class androidx.work.** { *; }
-keep interface androidx.work.** { *; }
-keepnames class * extends androidx.room.RoomDatabase
-keep class * extends androidx.room.RoomDatabase {
    !static <fields>;
    public static <fields>;
}
-keep @androidx.room.Database class *
-keepclassmembers @androidx.room.Database class * {
    public static ** INSTANCE;
    public static ** Companion;
}
-dontwarn androidx.work.**

# ============================================================
# AndroidX Startup (InitializationProvider reads initializers
# by class name at runtime).
# ============================================================
-keep class androidx.startup.** { *; }
-keep interface androidx.startup.** { *; }
-keep class * implements androidx.startup.Initializer { *; }
-dontwarn androidx.startup.**

# ============================================================
# Google Mobile Ads (GMA) / AdMob
# ============================================================
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.android.gms.internal.ads.** { *; }
-keep class com.google.ads.** { *; }
-dontwarn com.google.android.gms.ads.**
-dontwarn com.google.android.gms.internal.ads.**

# ============================================================
# google_mobile_ads Flutter plugin
# ============================================================
-keep class io.flutter.plugins.googlemobileads.** { *; }
-dontwarn io.flutter.plugins.googlemobileads.**

# ============================================================
# Google Play Core / In-App Purchase
# ============================================================
-keep class com.android.billingclient.** { *; }
-keep interface com.android.billingclient.** { *; }
-dontwarn com.android.billingclient.**
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# ============================================================
# AndroidX - general safety rules
# ============================================================
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-keepattributes Signature
-keepattributes Exceptions
-keepattributes SourceFile,LineNumberTable

-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ============================================================
# Hive
# ============================================================
-dontwarn com.hivedb.**

# ============================================================
# Kotlin
# ============================================================
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
