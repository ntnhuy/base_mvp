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

<#if includeDB>
greendao {
    schemaVersion 1
}
</#if>

android {
    defaultConfig {
        vectorDrawables.useSupportLibrary = true
        multiDexEnabled true
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

dependencies {
<#if includeFabric>
    compile('com.crashlytics.sdk.android:crashlytics:2.6.8@aar') {
        transitive = true;
    }
</#if>
    
<#if includeRetrofit || includeDB>
    compile "io.reactivex.rxjava2:rxjava:2.0.6"
    compile "io.reactivex.rxjava2:rxandroid:2.0.1"
<#if includeDB>
    compile 'org.greenrobot:greendao:3.2.2'
    compile 'net.zetetic:android-database-sqlcipher:3.5.6'
</#if>
<#if includeRetrofit>
    compile 'com.squareup.okhttp3:okhttp:3.2.0'
    compile 'com.squareup.okhttp3:logging-interceptor:3.2.0'
    compile 'com.squareup.retrofit2:converter-gson:2.3.0'
    compile 'com.squareup.retrofit2:retrofit:2.3.0'
    compile 'com.squareup.retrofit2:converter-moshi:2.3.0'
    compile 'com.squareup.retrofit2:adapter-rxjava2:2.3.0'
</#if>
</#if>
    
    compile 'com.android.support:multidex:1.0.0'
    compile 'com.android.support:appcompat-v7:${targetApi}.+'
    compile 'com.android.support:support-v4:${targetApi}.+'
    compile 'com.android.support:cardview-v7:21.0.+'
    compile 'com.android.support:design:${targetApi}.+'
<#if includeGA>
    compile 'com.google.android.gms:play-services:11.2.2'
</#if>
    compile 'com.fasterxml.jackson.core:jackson-core:2.7.0-rc2'
    compile 'com.fasterxml.jackson.core:jackson-databind:2.7.0-rc2'
    compile 'com.jakewharton:butterknife:8.8.1'
    annotationProcessor 'com.jakewharton:butterknife-compiler:8.8.1'
    compile 'de.hdodenhof:circleimageview:2.0.0'
    compile 'com.squareup.picasso:picasso:2.5.2'
    compile 'com.android.support.constraint:constraint-layout:1.0.2'
    compile 'com.google.dagger:dagger:2.9'
    compile 'com.karumi:dexter:4.1.0'
    
    compile 'com.squareup.picasso:picasso:2.5.2'
    compile 'com.squareup.okhttp:okhttp:2.5.0'
    compile 'org.greenrobot:eventbus:3.0.0'

    testCompile 'junit:junit:4.12'
    testCompile "org.mockito:mockito-core:2.7.1"
    testAnnotationProcessor "com.google.dagger:dagger-compiler:2.9"

    androidTestCompile "com.android.support.test.espresso:espresso-core:2.2.2"
    androidTestCompile "com.android.support.test.espresso:espresso-intents:2.2.2"
    androidTestCompile "org.mockito:mockito-core:2.7.1"
    androidTestAnnotationProcessor "com.google.dagger:dagger-compiler:2.9"
    annotationProcessor 'com.google.dagger:dagger-compiler:2.9'
    provided 'javax.annotation:jsr250-api:1.0'
}
configurations.all {
    resolutionStrategy.force "com.android.support:support-annotations:${targetApi}.+"
}

uploadArchives.enabled = false
