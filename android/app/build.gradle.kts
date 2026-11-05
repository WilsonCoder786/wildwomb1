import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.easydiy.app"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.easydiy.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 25
        targetSdk = 36
        versionCode = 2
        versionName = flutter.versionName
    }

    signingConfigs {
            if (keystorePropertiesFile.exists()) {
                create("release") {
                    keyAlias = keystoreProperties.getProperty("keyAlias")
                        ?: throw GradleException("Missing keyAlias in android/key.properties")
                    keyPassword = keystoreProperties.getProperty("keyPassword")
                        ?: throw GradleException("Missing keyPassword in android/key.properties")
                    storeFile = keystoreProperties.getProperty("storeFile")
                        ?.let { file(it) }
                        ?: throw GradleException("Missing storeFile in android/key.properties")
                    storePassword = keystoreProperties.getProperty("storePassword")
                        ?: throw GradleException("Missing storePassword in android/key.properties")
                }
            }
        }

    buildTypes {
        release {
            // Without a configured upload keystore, create an installable local APK.
            // Configure android/key.properties before publishing to an app store.
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }

            // Enable R8 minification + resource shrinking with explicit keep rules.
            // Fixes: "Failed to create an instance of androidx.work.impl.WorkDatabase"
            // which is caused by R8 stripping reflectively-instantiated Room/WorkManager
            // classes when no ProGuard rules are present.
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
