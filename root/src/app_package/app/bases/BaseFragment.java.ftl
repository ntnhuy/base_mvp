package ${packageName}.app.bases;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import ${packageName}.${classApplication};
import ${packageName}.app.di.component.DaggerFragmentComponent;
import ${packageName}.app.di.component.FragmentComponent;
import ${packageName}.utils.Utils;
import ${packageName}.widgets.ToolBarPlus;

/**
 * Created by ntnhuy  on 11/18/15
 */
public abstract class BaseFragment extends Fragment {
//    public static String name;
    /**
     * A dialog showing a progress indicator and an optional text message or
     * view.
     */
    protected ProgressDialog mProgressDialog;
    protected BaseActivity activity;
    protected FragmentManager fragmentManager;
    protected ToolBarPlus toolBar;
    private boolean isFirst = true;

    private FragmentComponent fragmentComponent;

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onDestroy()
     */
    @Override
    public void onDestroy() {
        super.onDestroy();
        mProgressDialog = null;
    }

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onPauseVideo()
     */
    @Override
    public void onPause() {
        super.onPause();
    }

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onResume()
     */
    @Override
    public void onResume() {
        super.onResume();
    }

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onStart()
     */
    @Override
    public void onStart() {
        super.onStart();
    }

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onStopVideo()
     */
    @Override
    public void onStop() {
        super.onStop();
    }

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onCreate(android.os.Bundle)
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        activity = (BaseActivity) getActivity();
        fragmentComponent = DaggerFragmentComponent.builder()
                .appComponent(${classApplication}.getInstance().getAppComponent())
                .build();

        fragmentComponent.inject(this);

        fragmentManager = activity.getSupportFragmentManager();
    }

    /*
     * (non-Javadoc)
     *
     * @see
     * android.support.v4.app.Fragment#onCreateView(android.view.LayoutInflater,
     * android.view.ViewGroup, android.os.Bundle)
     */
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return super.onCreateView(inflater, container, savedInstanceState);
    }

    /*
     * (non-Javadoc)
     *
     * @see android.support.v4.app.Fragment#onViewCreated(android.view.View,
     * android.os.Bundle)
     */
    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        toolBar = activity.getToolbar();
        setToolBar();
        if (isFirst) {
            initVariable();
            initView();
            initEvent();
            refresh(!isFirst);
            setupUI(view);
            isFirst = false;
        } else {
            isFirst = false;
        }
        if (activity != null) {
            if (!TextUtils.isEmpty(getFragmentLabel())) {
                activity.setActiveTitle(getFragmentLabel());
            }
        }
    }

    public BaseActivity getBaseActivity() {
        return activity;
    }

    public  void setToolBar(){
        if(toolBar != null) {
//            toolBar.setShowBadge(false);
        }
    }

    public abstract void initVariable();

    public abstract void initView();

    public abstract void initEvent();

    public abstract void refresh(boolean isRefreshData);

    public void setupUI(View view) {

        if (!(view instanceof EditText)) {
//            if (view.getTag() != null && view.getTag().toString().equalsIgnoreCase(Utils.getString(R.string.send).toString())) {
//                return;
//            }
            view.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    Utils.hideSoftKeyboard(activity);
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


    public abstract String getFragmentLabel();

    public void forceReloadFragment(BaseFragment fragment) {
        isFirst = true;

        if ((BaseActivity) getActivity() != null) {
            ((BaseActivity) getActivity()).refreshData();
            activity.getSupportFragmentManager()
                    .beginTransaction()
                    .detach(fragment)
                    .commitNowAllowingStateLoss();

            activity.getSupportFragmentManager()
                    .beginTransaction()
                    .attach(fragment)
                    .commitAllowingStateLoss();
        }
    }

    public boolean handleBackBtn() {
        return false;
    }

    public void onBackPressed() {
        activity.onBackPressed();
    }

    public FragmentComponent getFragmentComponent() {
        return fragmentComponent;
    }
}