package ${packageName}.app.bases;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.LayoutRes;
import android.support.design.widget.Snackbar;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.FrameLayout;

import ${packageName}.${classApplication};
import ${packageName}.R;
import ${packageName}.ui.activities.main.${activityClass};
import ${packageName}.app.di.component.ActivityComponent;
import ${packageName}.app.di.component.DaggerActivityComponent;
import ${packageName}.enums.FragmentEnums;
import ${packageName}.listeners.OnDismissDialog;
import ${packageName}.receivers.NetworkChangeReceiver;
import ${packageName}.utils.ToastUtils;
import ${packageName}.utils.Utils;
import ${packageName}.widgets.SweetAlert.SweetAlertDialog;
import ${packageName}.widgets.ToolBarPlus;

import javax.inject.Inject;


/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public abstract class BaseActivity extends AppCompatActivity implements BaseActivityView, NetworkChangeReceiver.OnConnectivityChangeListener {

    @Inject
    public BaseActivityPresenter presenter;
    private NetworkChangeReceiver receiver;
    protected Snackbar snackBar;

    //    protected Stack<Fragment> fragmentStack;
    protected FragmentManager fragmentManager;
    private Handler handler = new Handler();
    public SweetAlertDialog mDialog;
    private int backPressCount;
    private boolean isDestroyed;
    public String currentFragmentName;

    private ActivityComponent activityComponent;

    protected void onNewIntent(Intent intent) {

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        activityComponent = DaggerActivityComponent.builder()
                .appComponent(${classApplication}.getInstance().getAppComponent())
                .build();
        getActivityComponent().inject(this);

        presenter.attachView(this);
//        fragmentStack = new Stack<Fragment>();
        fragmentManager = getSupportFragmentManager();

//        overridePendingTransition(R.anim.activity_open_translate_x,
//                R.anim.activity_close_scale);
    }

    @Override
    public void setContentView(@LayoutRes int layoutResID) {
        super.setContentView(layoutResID);
        initVariable();
        initView();
        initEvent();
        onNewIntent(getIntent());
    }

    @Override
    protected void onResume() {
        super.onResume();
        presenter.attachView(this);
        presenter.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();

        presenter.onPause();
    }

    protected abstract void initVariable();

    protected abstract void initView();

    protected abstract void initEvent();

    public void showProgress() {
        if (mDialog == null) {
            mDialog = new SweetAlertDialog(this, SweetAlertDialog.PROGRESS_TYPE);
            mDialog.getProgressHelper().setBarColor(Color.parseColor("#A5DC86"));
            mDialog.setCancelable(false);
        }
        try {
            mDialog.setTitleText(Utils.getString(R.string.loading));
            if (!isFinishing() && mDialog != null && !mDialog.isShowing()) {
                mDialog.show();
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
                        }
                    } catch (Exception exp) {
                        exp.printStackTrace();
                    }
                }
            }, 1000);
        }
    }

    public void showSuccessMessage(String message, final OnDismissDialog listener) {
        if (!isFinishing()) {
            try {
                SweetAlertDialog sweetAlertDialog = new SweetAlertDialog(this, SweetAlertDialog.SUCCESS_TYPE)
                        .setTitleText(Utils.getString(R.string.dialog_success))
                        .setContentText(message);
                sweetAlertDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    @Override
                    public void onDismiss(DialogInterface dialog) {
                        if (listener != null) {
                            listener.onDismissDialog();
                        }
                    }
                });
                sweetAlertDialog.show();
            } catch (Exception e) {

            }
        }
    }

    public void changeFragment(FragmentEnums tag, boolean addBackStack, Bundle bundle) {
        
    }

    @Override
    public void onConnectivityLoss() {
        presenter.onConnectivityLoss();
    }

    @Override
    public void onConnectivityResume() {
        presenter.onConnectivityResume();
    }

    @Override
    public void registerNetworkStateReceiver() {
        receiver = new NetworkChangeReceiver();

        receiver.setListener(this);
        receiver.checkInitialState(getApplicationContext());

        registerReceiver(receiver, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
    }

    @Override
    public void unregisterNetworkStateReceiver() {
        if (receiver != null) {
            receiver.removeListener();
            unregisterReceiver(receiver);
            receiver = null;
        }
    }

    @Override
    public void ensureConnectionLossSnackBar() {
        if(snackBar == null) {
            final View contentView = findViewById(android.R.id.content);
            if (contentView != null) {
                snackBar = Snackbar.make(contentView, getString(R.string.txt_no_internet_connection), Snackbar.LENGTH_INDEFINITE);

                snackBar.setAction(getString(R.string.txt_close_snack_bar), new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        snackBar.dismiss();
                    }
                });
            }
        }
    }

    @Override
    public void displayConnectionLoss() {
        if(snackBar != null) {
            snackBar.show();
        }
    }

    @Override
    public void dismissConnectionLoss() {
        if(snackBar != null) {
            snackBar.dismiss();
        }
    }

    @Override
    public void addSnackBarTopMargin() {
        if(snackBar != null) {
            final FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) snackBar.getView().getLayoutParams();
            params.setMargins(params.leftMargin, params.topMargin, params.rightMargin, (int) getResources().getDimension(R.dimen.tab_bar_height));
            snackBar.getView().setLayoutParams(params);
        }
    }

    @Override
    public void onBackPressed() {
        if (getSupportFragmentManager().getFragments() != null && getSupportFragmentManager().getFragments().size() > 0) {
            try {
                BaseFragment fragment = (BaseFragment) getSupportFragmentManager().getFragments().get(getSupportFragmentManager().getBackStackEntryCount());
                ;
                if (fragment != null && fragment.handleBackBtn()) {
                    fragment.onBackPressed();
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (getSupportFragmentManager().getBackStackEntryCount() > 1) {
            try {
                getSupportFragmentManager().popBackStackImmediate();
                currentFragmentName = getSupportFragmentManager().getBackStackEntryAt(getSupportFragmentManager().getBackStackEntryCount() - 1).getName();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }
        ActivityManager am = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
        ComponentName cn = am.getRunningTasks(1).get(0).topActivity;
        if (cn.getClassName().equals(${activityClass}.class.getName())) {
            backPressCount++;
            if (backPressCount > 1) {
                finish();
            } else {
                ToastUtils.showShort(R.string.back_to_exit);
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        backPressCount = 0;
                    }
                }, 3000);
//                backPressCount = 0;
//                super.onBackPressed();
            }
        } else {
            super.onBackPressed();
        }
    }

    public void setActiveTitle(String title) {
    }

    public void refreshData() {

    }

    public abstract ToolBarPlus getToolbar();

    @Override
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        isDestroyed = true;
    }

    @Override
    public boolean isFinishing() {
        return isDestroyed;
    }

    @Override
    public Context getContext() {
        return this;
    }

    public ActivityComponent getActivityComponent() {
        return activityComponent;
    }
}
