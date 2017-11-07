package ${packageName}.app.di.component;

import android.app.Application;
import android.content.Context;

import ${packageName}.${classApplication};
<#if includeGA || includeFabric>
import ${packageName}.analyticss.AnalyticsManager;
import ${packageName}.app.di.module.AnalyticsModule;
<#if includeGA>
import com.google.android.gms.analytics.Tracker;
</#if>
</#if>
import ${packageName}.app.di.module.PreferenceModule;
import ${packageName}.datas.DataManager;
import ${packageName}.app.di.ApplicationContext;
import ${packageName}.app.di.module.AppModule;
<#if includeDB || includeRetrofit>
import ${packageName}.app.di.module.RxModule;
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
<#if includeRetrofit>
import ${packageName}.app.di.module.ApiModule;
</#if>
<#if includeDB>
import ${packageName}.app.di.module.DBModule;
</#if>
</#if>
import javax.inject.Singleton;

import dagger.Component;

/**
 * Created by tohuy on 9/17/17.
 */

@Singleton
@Component(modules = {AppModule.class, PreferenceModule.class<#if includeRetrofit || includeDB>, RxModule.class<#if includeDB>, DBModule.class</#if><#if includeRetrofit>, ApiModule.class</#if></#if><#if includeGA || includeFabric>, AnalyticsModule.class</#if>})
public interface AppComponent {

    void inject(${classApplication} app);

    @ApplicationContext
    Context context();

    Application application();
<#if includeDB || includeRetrofit>
    CompositeDisposable compositeDisposable();

    SchedulerProvider schedulerProvider();
</#if>
    DataManager getDataManager();
<#if includeGA || includeFabric>
    AnalyticsManager analyticsManager();
</#if>
}
