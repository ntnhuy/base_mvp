package ${packageName}.ui.activities.splash;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

import ${packageName}.app.bases.BaseActivity;

import ${packageName}.R;
import ${packageName}.ui.activities.main.${activityClass};
import ${packageName}.widgets.ToolBarPlus;

import javax.inject.Inject;

public class SplashActivity extends BaseActivity implements SplashView {

    @Inject
    SplashPresenter presenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
    }

    @Override
    protected void initVariable() {
        getActivityComponent().inject(this);
        presenter.attachView(this);
    }

    @Override
    protected void initView() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent i = new Intent(SplashActivity.this, ${activityClass}.class);
                i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
                startActivity(i);
                finish();
            }
        }, 1500);
    }

    @Override
    protected void initEvent() {

    }

    @Override
    public ToolBarPlus getToolbar() {
        return null;
    }

    public boolean hasTabBar() {
        return false;
    }

    @Override
    public void resetView() {

    }
}
