package ${packageName}.app.di.module;

import ${packageName}.BuildConfig;
<#if includeFabric>
import ${packageName}.analyticss.crashlytics.AppCrashlyticsHelper;
import ${packageName}.analyticss.crashlytics.CrashlyticsHelper;
import com.crashlytics.android.Crashlytics;
</#if>
<#if includeGA>
import ${packageName}.analyticss.ga.AppGAHelper;
import ${packageName}.analyticss.ga.GAHelper;
import ${packageName}.app.di.TrackerInfo;
</#if>

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@Module
public class AnalyticsModule {

<#if includeGA>
    @Provides
    @TrackerInfo
    String provideTrackerKey() {
        return BuildConfig.GA_KEY;
    }

    @Provides
    @Singleton
    GAHelper provideGAHelper(AppGAHelper appGAHelper) {
        return appGAHelper;
    }
</#if>
<#if includeFabric>
    @Provides
    @Singleton
    Crashlytics provideCrashlytics() {
        return new Crashlytics();
    }

    @Provides
    @Singleton
    CrashlyticsHelper provideCrashlyticsHelper(AppCrashlyticsHelper crashlyticsHelper) {
        return crashlyticsHelper;
    }
</#if>
}
