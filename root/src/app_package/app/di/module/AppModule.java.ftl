package ${packageName}.app.di.module;

import android.app.Application;
import android.content.Context;
<#if includeGA || includeFabric>
import ${packageName}.analyticss.AnalyticsManager;
import ${packageName}.analyticss.AppAnalyticsManager;
</#if>
import ${packageName}.datas.AppDataManager;
import ${packageName}.datas.DataManager;
import ${packageName}.app.di.ApplicationContext;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@Module
public class AppModule {

    Application mApplication;

    public AppModule(Application application) {
        mApplication = application;
    }

    @Provides
    @Singleton
    Application providesApplication() {
        return mApplication;
    }

    @Provides
    @ApplicationContext
    Context provideContext() {
        return mApplication;
    }

    @Provides
    @Singleton
    DataManager provideDataManager(AppDataManager appDataManager) {
        return appDataManager;
    }
<#if includeGA || includeFabric>
    @Provides
    @Singleton
    AnalyticsManager provideAnalyticsManager(AppAnalyticsManager appAnalyticsManager) {
        return appAnalyticsManager;
    }
</#if>
}
