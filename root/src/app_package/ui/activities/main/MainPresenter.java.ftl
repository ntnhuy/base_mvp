package ${packageName}.ui.activities.main;

import android.app.Activity;
import android.support.annotation.NonNull;
import android.support.design.widget.NavigationView;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import ${packageName}.R;
import ${packageName}.datas.models.EventBusModel;
import ${packageName}.app.bases.BasePresenter;
import ${packageName}.datas.DataManager;
import ${packageName}.utils.Utils;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import javax.inject.Inject;
<#if includeRetrofit || includeDB>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.functions.Consumer;
</#if>
<#if !hasTabbar>
import android.support.annotation.IdRes;
import ${packageName}.enums.FragmentEnums;
<#else>
import ${packageName}.widgets.iconWithNotification.IconWithNotification;
import ${packageName}.${classApplication};
import android.widget.RelativeLayout;
import android.view.Gravity;
import ${packageName}.utils.Constants;
import android.graphics.Color;
import android.os.Handler;
import android.support.design.widget.TabLayout;
import android.view.Gravity;
</#if>

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class ${activityClass?replace('Activity', '')}Presenter extends BasePresenter<${activityClass?replace('Activity', '')}View> {
<#if hasTabbar>
    private int mLastActiveTab = Constants.TAB.TAB1;
</#if>

    @Inject
    public ${activityClass?replace('Activity', '')}Presenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
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

    public void setNavigationItemSelectedListener(NavigationView navigationView) {
        navigationView.setNavigationItemSelectedListener(new NavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
//                if (item.isCheckable()) {
//                    if (item.isChecked()) item.setChecked(false);
//                    else item.setChecked(true);
//                }

                switch (item.getItemId()) {
                    case R.id.logout:
                    <#if includeDB>
                        subscriptions.addAll(dataManager.logout()
                                .subscribeOn(schedulerProvider.io())
                                .observeOn(schedulerProvider.ui())
                                .subscribe(new Consumer<Boolean>() {
                                    @Override
                                    public void accept(@io.reactivex.annotations.NonNull final Boolean aBoolean) throws Exception {
                                        dataManager.setIsLogin(false);
                                    }
                                }, new Consumer<Throwable>() {
                                    @Override
                                    public void accept(@io.reactivex.annotations.NonNull Throwable throwable) throws Exception {
//                                        ToastUtils.showLong(R.string.cant_logout);
                                    }
                                }));
                    <#else>
                        dataManager.logout();
                    </#if>
                        break;
                    }

                //Closing drawer on item click
                getMvpView().closeDrawer();
                return false;
            }
        });
    }

    public void setupUI(View view) {

        if (!(view instanceof EditText)) {
            view.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    Utils.hideSoftKeyboard((Activity) getMvpView());
                    return false;
                }
            });
        }

        if (view instanceof ViewGroup) {
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
                View innerView = ((ViewGroup) view).getChildAt(i);
                setupUI(innerView);
            }
        }
    }

<#if hasTabbar>
    public Runnable selectTab(final TabLayout tabLayout) {
        return new Runnable() {
            @Override
            public void run() {
                TabLayout.Tab tab = tabLayout.getTabAt(tabLayout.getSelectedTabPosition());
                final int position = tab.getPosition();
                mLastActiveTab = position;
                getMvpView().setCurrentItem(position, true);
                new Handler().post(new Runnable() {
                    @Override
                    public void run() {
                        if (getMvpView().getCurrentFragment() != null) {
                            getMvpView().resetView();
                            getMvpView().setActiveTitle(getMvpView().getActionBarTitle(position));
                        } else {
                            new Handler().postDelayed(this, 200);
                        }
                    }
                });
                switch (position) {
                    case Constants.TAB.TAB1:
                        if (tab.getCustomView() != null) {

                        }
                        break;

                    case Constants.TAB.TAB2:
                        if (tab.getCustomView() != null) {

                        }
                        break;
                }
            }
        };
    }

    public Runnable unSelectLastActiveTab(final TabLayout tabLayout) {
        return new Runnable() {
            @Override
            public void run() {
                int position = mLastActiveTab;
                TabLayout.Tab tab = tabLayout.getTabAt(position);
                switch (position) {
                    case Constants.TAB.TAB1:
                        if (tab.getCustomView() != null) {

                        }
                        break;

                    case Constants.TAB.TAB2:
                        if (tab.getCustomView() != null) {

                        }
                        break;
                }
            }
        };
    }
<#else>
    public void onCreatedView(FragmentEnums enums, @IdRes int resId) {
        changeFragment(getMvpView().getSupportFragmentManager(), enums, true, null, resId);
    }
</#if>
}
