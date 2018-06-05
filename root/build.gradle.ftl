<#if includeFabric>
buildscript {
    repositories {
        jcenter()
        maven { url 'https://maven.fabric.io/public' }
    }
    dependencies {
        classpath 'io.fabric.tools:gradle:1.+'
    }
}

repositories {
    jcenter()
    maven { url 'https://maven.fabric.io/public' }
}
</#if>

dependencies {
<#if includeFabric>
    implementation('com.crashlytics.sdk.android:crashlytics:2.6.8@aar') {
        transitive = true;
    }
</#if>
    
<#if includeRetrofit || includeDB>
    implementation "io.reactivex.rxjava2:rxjava:2.0.6"
    implementation "io.reactivex.rxjava2:rxandroid:2.0.1"
<#if includeDB>
    implementation 'org.greenrobot:greendao:3.2.2'
    implementation 'net.zetetic:android-database-sqlcipher:3.5.6'
</#if>
<#if includeRetrofit>
    implementation 'com.squareup.okhttp3:okhttp:3.2.0'
    implementation 'com.squareup.okhttp3:logging-interceptor:3.2.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.3.0'
    implementation 'com.squareup.retrofit2:retrofit:2.3.0'
    implementation 'com.squareup.retrofit2:converter-moshi:2.3.0'
    implementation 'com.squareup.retrofit2:adapter-rxjava2:2.3.0'
</#if>
</#if>
    
    implementation 'com.android.support:multidex:1.0.0'
    implementation 'com.android.support:appcompat-v7:${targetApi}.+'
    implementation 'com.android.support:support-v4:${targetApi}.+'
    implementation 'com.android.support:cardview-v7:21.0.+'
    implementation 'com.android.support:design:${targetApi}.+'
<#if includeGA>
    implementation 'com.google.android.gms:play-services:11.2.2'
</#if>
    implementation 'com.fasterxml.jackson.core:jackson-core:2.7.0-rc2'
    implementation 'com.fasterxml.jackson.core:jackson-databind:2.7.0-rc2'
    implementation 'de.hdodenhof:circleimageview:2.0.0'
    implementation 'com.squareup.picasso:picasso:2.5.2'
    implementation 'com.android.support.constraint:constraint-layout:1.0.2'
    implementation 'com.google.dagger:dagger:2.9'
    implementation 'com.karumi:dexter:4.1.0'
    
    implementation 'com.squareup.picasso:picasso:2.5.2'
    implementation 'com.squareup.okhttp:okhttp:2.5.0'
    implementation 'org.greenrobot:eventbus:3.0.0'

    testImplementation 'junit:junit:4.12'
    testImplementation "org.mockito:mockito-core:2.7.1"
    testAnnotationProcessor "com.google.dagger:dagger-compiler:2.9"

    androidTestImplementation "com.android.support.test.espresso:espresso-core:2.2.2"
    androidTestImplementation "com.android.support.test.espresso:espresso-intents:2.2.2"
    androidTestImplementation "org.mockito:mockito-core:2.7.1"
    androidTestAnnotationProcessor "com.google.dagger:dagger-compiler:2.9"
    annotationProcessor 'com.google.dagger:dagger-compiler:2.9'
    compileOnly 'javax.annotation:jsr250-api:1.0'
}
configurations.all {
    resolutionStrategy.force "com.android.support:support-annotations:${targetApi}.+"
}

uploadArchives.enabled = false
android {
    defaultConfig {
        vectorDrawables.useSupportLibrary = true
        multiDexEnabled true
    }

    dataBinding {
        enabled = true
    }

<#if includeFabric || includeDB>
    apply {
    <#if includeFabric>
        plugin 'io.fabric'
    </#if>
    <#if includeDB>
        plugin 'org.greenrobot.greendao'
    </#if>
    }
</#if>
    flavorDimensions "name"
    productFlavors {
        mockup {
            applicationId "${packageName}.mockup"
            buildConfigField("String", "BASE_URL", '"${stagingBaseUrl}"')
            buildConfigField("String", "GA_KEY", '"${GA_KEY}"')
            dimension "name"
        }

        production {
            applicationId "${packageName}"
            buildConfigField("String", "BASE_URL", '"${releaseBaseUrl}"')
            buildConfigField("String", "GA_KEY", '"${GA_KEY}"')
            dimension "name"
        }
    }

//    applicationVariants.all {
//        variant->
//        variant.outputs.each {
//            output->
//            output.outputFile= new File(
//                    output.outputFile.parent,
//                    "basemvp.apk")
//        }
//    }

    packagingOptions {
        exclude 'META-INF/DEPENDENCIES.txt'
        exclude 'META-INF/LICENSE.txt'
        exclude 'META-INF/NOTICE.txt'
        exclude 'META-INF/NOTICE'
        exclude 'META-INF/LICENSE'
        exclude 'META-INF/DEPENDENCIES'
        exclude 'META-INF/notice.txt'
        exclude 'META-INF/license.txt'
        exclude 'META-INF/dependencies.txt'
        exclude 'META-INF/LGPL2.1'
        exclude 'META-INF/rxjava.properties'
    }
}
<#if includeDB>
greendao {
    schemaVersion 1
}
</#if>