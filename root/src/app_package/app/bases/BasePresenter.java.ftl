package ${packageName}.app.bases;

import android.content.DialogInterface;
import android.content.Intent;
import android.databinding.BaseObservable;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentTransaction;
import android.text.TextUtils;
import android.support.annotation.IdRes;
import android.support.v4.app.FragmentManager;

import ${packageName}.R;
import ${packageName}.ui.activities.splash.SplashActivity;
import ${packageName}.datas.DataManager;
import ${packageName}.enums.FragmentEnums;
import ${packageName}.ui.fragments.home.HomeFragment;
import ${packageName}.utils.Utils;
import ${packageName}.widgets.SweetAlert.SweetAlertDialog;
import ${packageName}.listeners.OnDismissDialog;

<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
<#if includeRetrofit>
import retrofit2.Call;
import retrofit2.Response;
</#if>
</#if>

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public abstract class BasePresenter<T extends MvpView> extends BaseObservable implements Presenter<T> {

    protected final DataManager dataManager;
    <#if includeDB || includeRetrofit>
    protected final CompositeDisposable subscriptions;
    protected final SchedulerProvider schedulerProvider;
    </#if>

    private final String TAG = getClass().getSimpleName();
    private T mvpView;
    private SweetAlertDialog mDialog;
    private Handler handler = new Handler();

    public BasePresenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        this.dataManager = dataManager;
        <#if includeDB || includeRetrofit>
        this.subscriptions = compositeDisposable;
        this.schedulerProvider =  schedulerProvider;
        </#if>
    }

    @Override
    public void attachView(T mvpView) {
        this.mvpView = mvpView;
    }

    @Override
    public void detachView() {
    <#if includeDB || includeRetrofit>
        subscriptions.clear();
    </#if>
        mvpView = null;
    }

    public boolean isViewAttached() {
        return mvpView != null;
    }

    public T getMvpView() {
        return mvpView;
    }

    public void checkViewAttached() {
        if (!isViewAttached()) throw new MvpViewNotAttachedException();
    }

    public static class MvpViewNotAttachedException extends RuntimeException {
        public MvpViewNotAttachedException() {
            super("Please call Presenter.attachView(MvpView) before" +
                    " requesting data to the Presenter");
        }
    }

    protected void changeFragment(FragmentManager fragmentManager, FragmentEnums tag, boolean addBackStack, Bundle bundle, @IdRes int resId) {
        BaseFragment mainFragment = null;
        String name = null;
        getMvpView().resetView();
        switch (tag) {
            case HOME:
                mainFragment = new HomeFragment();
                mainFragment.setArguments(bundle);
                name = HomeFragment.class.getSimpleName();
                break;

            default:
                mainFragment = new HomeFragment();
                mainFragment.setArguments(bundle);
                name = HomeFragment.class.getSimpleName();
                break;
        }
        switchContent(fragmentManager, mainFragment, addBackStack, name, resId);
    }

    protected void switchContent(FragmentManager fragmentManager, BaseFragment fragment, boolean addBackStack, String name, @IdRes int resId) {
        if (fragment != null) {
            FragmentTransaction transaction = fragmentManager.beginTransaction();
            transaction.setCustomAnimations(
                    R.anim.fade_in,
                    R.anim.fade_out
            );
            if (addBackStack) {
                transaction.addToBackStack(name);
            }
            transaction.replace(resId, fragment, name);
            transaction.commit();
        }
    }

    private void initDialog(String message, int type) {
        if (mvpView.getContext() == null) {
            //check case NPE
            return;
        }
       /* if (mvpView == null || (mvpView != null && mvpView.getContext() == null)) {
            //check case NPE
            Log.d(TAG, "initDialog: ");
            return;
        }*/
        switch (type) {
            case SweetAlertDialog.PROGRESS_TYPE:
                mDialog = new SweetAlertDialog(mvpView.getContext(), SweetAlertDialog.PROGRESS_TYPE);
                mDialog.getProgressHelper().setBarColor(Color.parseColor("#A5DC86"));
                mDialog.setTitleText(TextUtils.isEmpty(message) ? Utils.getString(R.string.loading) : message);
                break;

            case SweetAlertDialog.SUCCESS_TYPE:
                if (mDialog == null) {
                    mDialog = new SweetAlertDialog(mvpView.getContext(), SweetAlertDialog.SUCCESS_TYPE)
                            .setTitleText(Utils.getString(R.string.dialog_success))
                            .setContentText(message);
                } else {
                    mDialog.setTitleText(Utils.getString(R.string.dialog_success))
                            .setContentText(message)
                            .changeAlertType(SweetAlertDialog.SUCCESS_TYPE);
                }
                break;

            case SweetAlertDialog.ERROR_TYPE:
                if (mDialog == null) {
                    mDialog = new SweetAlertDialog(mvpView.getContext(), SweetAlertDialog.ERROR_TYPE)
                            .setTitleText(Utils.getString(R.string.dialog_text_error_title))
                            .setContentText(message)
                            .setConfirmText(Utils.getString(R.string.dialog_ok));
                } else {
                    mDialog.setTitleText(Utils.getString(R.string.dialog_text_error_title))
                            .setContentText(message)
                            .setConfirmText(Utils.getString(R.string.dialog_ok))
                            .changeAlertType(SweetAlertDialog.ERROR_TYPE);
                }
                break;

            case SweetAlertDialog.WARNING_TYPE:
                if (mDialog == null) {
                    mDialog = new SweetAlertDialog(mvpView.getContext(), SweetAlertDialog.WARNING_TYPE)
                            .setTitleText(Utils.getString(R.string.dialog_text_warning_title))
                            .setContentText(message)
                            .setConfirmText(Utils.getString(R.string.dialog_ok));
                } else {
                    mDialog.setTitleText(Utils.getString(R.string.dialog_text_warning_title))
                            .setContentText(message)
                            .setConfirmText(Utils.getString(R.string.dialog_ok))
                            .changeAlertType(SweetAlertDialog.WARNING_TYPE);
                }
                break;

            case SweetAlertDialog.NORMAL_TYPE:
                if (mDialog == null) {
                    mDialog = new SweetAlertDialog(mvpView.getContext(), SweetAlertDialog.NORMAL_TYPE)
                            .setTitleText(Utils.getString(R.string.app_name))
                            .setContentText(message)
                            .setConfirmText(Utils.getString(R.string.dialog_ok));
                } else {
                    mDialog.setTitleText(Utils.getString(R.string.app_name))
                            .setContentText(message)
                            .setConfirmText(Utils.getString(R.string.dialog_ok))
                            .changeAlertType(SweetAlertDialog.NORMAL_TYPE);
                }
                break;
        }
        mDialog.setCancelable(false);
    }

    public void showProgress() {
        if (handler != null) {
            handler.removeCallbacksAndMessages(null);
        }
        if (mvpView == null || mvpView.getContext() == null) {
            return;
        }
        if (mDialog != null && mDialog.getAlerType() == SweetAlertDialog.PROGRESS_TYPE) {
            return;
        }
        initDialog("", SweetAlertDialog.PROGRESS_TYPE);
        try {
            if (mDialog != null && !mDialog.isShowing()) {
                try {
//                    mDialog.show();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void showProgressV2(String message) {
        if (handler != null) {
            handler.removeCallbacksAndMessages(null);
        }
        if (mvpView == null || mvpView.getContext() == null) {
            return;
        }
        if (mDialog != null && mDialog.getAlerType() == SweetAlertDialog.PROGRESS_TYPE) {
            return;
        }
        initDialog(message, SweetAlertDialog.PROGRESS_TYPE);
        try {
            if (mDialog != null && !mDialog.isShowing()) {
                try {
                    mDialog.show();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void dismissProgress() {
        if (mDialog != null && handler != null) {
            handler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (mDialog != null) {
                            mDialog.dismiss();
                            mDialog = null;
                        }
                    } catch (Exception exp) {
                        exp.printStackTrace();
                    }
                }
            }, 200);
        }
    }

    public void showSuccessDialog(String message, final OnDismissDialog callback /*= null*/) {
        initDialog(message, SweetAlertDialog.SUCCESS_TYPE);
        try {
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
            if (mDialog != null && !mDialog.isShowing()) {
                try {
                    mDialog.show();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            mDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                @Override
                public void onDismiss(DialogInterface dialog) {
                    if (callback != null) {
                        callback.onDismissDialog();
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void showErrorDialog(String message, final OnDismissDialog callback /*= null*/) {
        initDialog(message, SweetAlertDialog.ERROR_TYPE);
        try {
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
            if (mDialog != null && !mDialog.isShowing() && mvpView != null) {
                try {
                    mDialog.show();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            mDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                @Override
                public void onDismiss(DialogInterface dialog) {
                    if (callback != null) {
                        callback.onDismissDialog();
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void showWarningDialog(String message, final OnDismissDialog callback) {
        initDialog(message, SweetAlertDialog.WARNING_TYPE);
        try {
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
            if (mDialog != null && !mDialog.isShowing()) {
                try {
                    mDialog.show();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            mDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                @Override
                public void onDismiss(DialogInterface dialog) {
                    if (callback != null) {
                        callback.onDismissDialog();
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void showConfirmDialog(String message, final OnDismissDialog callback) {
        initDialog(message, SweetAlertDialog.NORMAL_TYPE);
        try {
            if (handler != null) {
                handler.removeCallbacksAndMessages(null);
            }
            if (mDialog != null && !mDialog.isShowing()) {
                try {
                    mDialog.show();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            mDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                @Override
                public void onDismiss(DialogInterface dialog) {
                    if (callback != null) {
                        callback.onDismissDialog();
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

<#if includeRetrofit>
    public <E> void checkResponse(Response<E> response) {
        if (isViewAttached()) {
            try {
                if (response != null && response.isSuccessful() && response.body() != null) {
                    onSuccess(response);
                } else if (response.code() == 400 || response.body() == null) {
                    onBadRequest(response);
                } else if (response.code() == 401) {
                    onUnauthorized(response);
                }
            } catch (NullPointerException ex) {
                onBadRequest(response);
            }
        }
    }

    public void onSuccess(Response response) {

    }

    public void onBadRequest(Response response) {

    }

    public void onUnauthorized(Response response) {
        dismissProgress();
        Intent intent = new Intent(getMvpView().getContext(), SplashActivity.class);
        getMvpView().getContext().startActivity(intent);
    }

    public void onFail(Call<String> call, Throwable t) {
        showErrorDialog(Utils.getString(R.string.please_do_it_again) + t.toString(), null);
    }
</#if>
}