package ${packageName}.ui.activities.main;

import ${packageName}.app.bases.BaseFragment;
import ${packageName}.app.bases.MvpView;
<#if !hasTabbar>
import android.support.v4.app.FragmentManager;
</#if>

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface ${activityClass?replace('Activity', '')}View extends MvpView {
<#if hasTabbar>
    void setCurrentItem(int position, boolean isSmooth);
    BaseFragment getCurrentFragment();
    void setActiveTitle(String text);
    String getActionBarTitle(int position);
<#else>
	FragmentManager getSupportFragmentManager();
</#if>
    void closeDrawer();
}
