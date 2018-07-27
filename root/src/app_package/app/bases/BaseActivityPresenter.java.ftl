package ${packageName}.app.bases;

import ${packageName}.datas.DataManager;
<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
</#if>
import javax.inject.Inject;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class BaseActivityPresenter extends BasePresenter<BaseActivityView>{

    private boolean mReceiverRegistered = false;

    @Inject
    public BaseActivityPresenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(dataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
    }

    public void onCreate(){
        
    }

    public synchronized void onResume(){
        if(!mReceiverRegistered) {
            getMvpView().registerNetworkStateReceiver();
            mReceiverRegistered = true;
        }
    }

    public synchronized void onPause(){
        if(mReceiverRegistered) {
            getMvpView().unregisterNetworkStateReceiver();
            mReceiverRegistered = false;
        }
    }

    public void onConnectivityLoss(){
        getMvpView().ensureConnectionLossSnackBar();
        if(getMvpView().hasTabBar()) {
            getMvpView().addSnackBarTopMargin();
        }
        getMvpView().displayConnectionLoss();
    }

    public void onConnectivityResume(){
        getMvpView().dismissConnectionLoss();
    }
}
