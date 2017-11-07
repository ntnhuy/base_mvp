buildscript {
    dependencies {
        <#if includeGA>
        classpath 'com.google.gms:google-services:3.0.0'
        </#if>
        <#if includeDB>
        classpath 'org.greenrobot:greendao-gradle-plugin:3.2.2'
        </#if>
    }
}

allprojects {
    repositories {
        maven {
            url "https://maven.google.com"
        }
    }
}
