package ${packageName}.ui.dialogs;

import ${packageName}.app.bases.BasePresenter;
import ${packageName}.datas.DataManager;
<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
</#if>
import javax.inject.Inject;

public class BaseDialogPresenter extends BasePresenter<BaseDialogMvp> {

    @Inject
    public BaseDialogPresenter(DataManager mDataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(mDataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
    }

    public void clickBtnOk() {
        getMvpView().onDismissDialog();
    }

    public void clickIvRight() {
        getMvpView().onDismissDialog();
    }
}
