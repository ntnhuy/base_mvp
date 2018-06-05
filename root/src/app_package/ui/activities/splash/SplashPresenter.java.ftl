package ${packageName}.ui.activities.splash;

import ${packageName}.app.bases.BasePresenter;
import ${packageName}.datas.DataManager;
<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
</#if>

import javax.inject.Inject;

/**
 * Created by tohuy on 9/22/17.
 */

public class SplashPresenter extends BasePresenter<SplashView> {

    @Inject
    public SplashPresenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(dataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
    }

    public boolean isFirstInstallApp() {
        return dataManager.isFirstInstallApp();
    }

    public void setIsFirstInstallApp(boolean isFirstInstallApp) {
        dataManager.setIsFirstInstallApp(isFirstInstallApp);
    }

    public boolean isLogin() {
        return dataManager.isLogin();
    }
}
