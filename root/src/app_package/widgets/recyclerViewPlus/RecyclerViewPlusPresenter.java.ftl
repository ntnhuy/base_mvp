package ${packageName}.widgets.recyclerViewPlus;

import ${packageName}.datas.DataManager;
import ${packageName}.app.bases.BasePresenter;
<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
</#if>

import javax.inject.Inject;

public class RecyclerViewPlusPresenter extends BasePresenter<RecyclerViewPlusView> {

    private RecyclerViewPlusState mState = RecyclerViewPlusState.LOADING;

    @Inject
    public RecyclerViewPlusPresenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(dataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
    }

    public void onAttachedToWindow(){
        final boolean recycler = getMvpView().findRecyclerView();
        final boolean loading = getMvpView().findLoadingState();
        final boolean empty = getMvpView().findEmptyState();
        final boolean error = getMvpView().findErrorState();
        if(!recycler && !loading && !empty && !error){
            throw new IllegalStateException("Must have at least one state view!");
        }

        switch (mState) {
            case CONTENT:
                getMvpView().showContentState();
                getMvpView().hideLoadingState();
                getMvpView().hideEmptyState();
                getMvpView().hideErrorState();
                break;
            case LOADING:
                getMvpView().hideContentState();
                getMvpView().showLoadingState();
                getMvpView().hideEmptyState();
                getMvpView().hideErrorState();
                break;
            case EMPTY:
                getMvpView().hideContentState();
                getMvpView().hideLoadingState();
                getMvpView().showEmptyState();
                getMvpView().hideErrorState();
                break;
            case ERROR:
                getMvpView().hideContentState();
                getMvpView().hideLoadingState();
                getMvpView().hideEmptyState();
                getMvpView().showErrorState();
                break;
        }
    }

    public void setState(RecyclerViewPlusState state) {
        if(mState != state) {
            final RecyclerViewPlusState oldState = mState;
            mState = state;

            switch (oldState) {
                case CONTENT:
                    getMvpView().hideContentStateAnimated();
                    break;
                case LOADING:
                    getMvpView().hideLoadingStateAnimated();
                    break;
                case EMPTY:
                    getMvpView().hideEmptyStateAnimated();
                    break;
                case ERROR:
                    getMvpView().hideErrorStateAnimated();
                    break;
            }

            switch (mState) {
                case CONTENT:
                    getMvpView().showContentStateAnimated();
                    break;
                case LOADING:
                    getMvpView().showLoadingStateAnimated();
                    break;
                case EMPTY:
                    getMvpView().showEmptyStateAnimated();
                    break;
                case ERROR:
                    getMvpView().showErrorStateAnimated();
                    break;
            }
        }
    }

    public RecyclerViewPlusState getState(){
        return mState;
    }

    public enum RecyclerViewPlusState {
        CONTENT,
        LOADING,
        EMPTY,
        ERROR
    }
}
