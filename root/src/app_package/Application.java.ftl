package ${packageName};

import android.support.multidex.MultiDexApplication;

<#if includeGA || includeFabric>
import ${packageName}.analyticss.AnalyticsManager;
import ${packageName}.app.di.module.AnalyticsModule;
<#if includeFabric>
import com.crashlytics.android.Crashlytics;
import io.fabric.sdk.android.Fabric;
</#if>
<#if includeGA>
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Tracker;
</#if>
</#if>

import ${packageName}.app.di.module.PreferenceModule;
import ${packageName}.datas.DataManager;
import ${packageName}.app.di.component.AppComponent;
import ${packageName}.app.di.component.DaggerAppComponent;
import ${packageName}.app.di.module.AppModule;
<#if includeRetrofit || includeDB>
<#if includeRetrofit>
import ${packageName}.app.di.module.ApiModule;
</#if>
<#if includeDB>
import ${packageName}.app.di.module.DBModule;
</#if>
import ${packageName}.app.di.module.RxModule;
</#if>

import javax.inject.Inject;

/**
 * Created by ntnhuy on 5/29/2015.
 */
public class ${classApplication} extends MultiDexApplication {

    private static ${classApplication} sInstance;

    @Inject
    DataManager dataManager;
<#if includeGA || includeFabric>
    @Inject
    AnalyticsManager analyticsManager;
</#if>

    private AppComponent appComponent;

    public static ${classApplication} getInstance() {
        return sInstance;
    }

    //singleton
    @Override
    public void onCreate() {
        super.onCreate();
        sInstance = this;

        setAppComponent(DaggerAppComponent.builder()
                .appModule(new AppModule(this))
                <#if includeRetrofit || includeDB>
                <#if includeDB>
                .dBModule(new DBModule())
                </#if>
                <#if includeRetrofit>
                .apiModule(new ApiModule())
                </#if>
                .rxModule(new RxModule())
                </#if>
                .preferenceModule(new PreferenceModule())
                <#if includeGA || includeFabric>
                .analyticsModule(new AnalyticsModule())
                </#if>
                .build());

        getAppComponent().inject(this);
        <#if includeFabric>
        Fabric.with(this, analyticsManager.getCrashlytics());
        </#if>

    }

    public AppComponent getAppComponent() {
        return appComponent;
    }

    public void setAppComponent(AppComponent appComponent) {
        this.appComponent = appComponent;
    }
}
