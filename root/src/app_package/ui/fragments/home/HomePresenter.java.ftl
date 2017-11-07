package ${packageName}.ui.fragments.home;

import ${packageName}.app.bases.BasePresenter;
import ${packageName}.datas.DataManager;
<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
</#if>
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import ${packageName}.datas.models.EventBusModel;

import javax.inject.Inject;

/**
 * Created by tohuy on 9/10/2017.
 */

public class HomePresenter extends BasePresenter<HomeView> {

    @Inject
    public HomePresenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(dataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
    	if (!EventBus.getDefault().isRegistered(this)) {
            EventBus.getDefault().register(this);
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onEvent(EventBusModel eventBusModel) {
        switch (eventBusModel.getBusEnum()) {

        }
    }

    public void onResume() {
        if (!EventBus.getDefault().isRegistered(this)) {
            EventBus.getDefault().register(this);
        }
    }

    public void onDestroy() {
        EventBus.getDefault().unregister(this);
    }
}
