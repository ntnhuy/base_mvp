package ${packageName}.ui.activities.main;

import ${packageName}.app.bases.BaseFragment;
import ${packageName}.app.bases.MvpView;
<#if !hasTabbar>
import android.support.v4.app.FragmentManager;
</#if>

/**
 * Created by tohuy on 9/14/17.
 */

public interface ${activityClass?replace('Activity', '')}View extends MvpView {
<#if hasTabbar>
    void selectTab(int position);
    void setCurrentItem(int position, boolean isSmooth);
    BaseFragment getCurrentFragment();
    void setActiveTitle(String text);
    String getActionBarTitle(int position);
<#else>
	FragmentManager getSupportFragmentManager();
</#if>
    void closeDrawer();
}
