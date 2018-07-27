package ${packageName}.ui.activities.main;

import android.content.Context;
import android.content.Intent;
import android.support.design.widget.TabLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

import ${packageName}.R;
<#if hasTabbar>
import ${packageName}.adapters.${activityClass}PagerAdapter;
<#else>
import ${packageName}.enums.FragmentEnums;
</#if>
import ${packageName}.app.bases.BaseActivity;
import ${packageName}.app.bases.BaseFragment;
import ${packageName}.widgets.ToolBarPlus;
import ${packageName}.utils.Utils;
import ${packageName}.databinding.Activity${activityClass?replace('Activity', '')}Binding;

import javax.inject.Inject;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class ${activityClass} extends BaseActivity implements ${activityClass?replace('Activity', '')}View {
<#if hasTabbar>
    private ${activityClass}PagerAdapter adapter;
</#if>
    @Inject
    public ${activityClass?replace('Activity', '')}Presenter presenter;
    Activity${activityClass?replace('Activity', '')}Binding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});
    }

    @Override
    public void onResume() {
        super.onResume();
        if (presenter != null) {
            presenter.onResume();
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        presenter.onDestroy();
        presenter.detachView();
    }

    @Override
    protected void initVariable() {
        View decorView = getWindow().getDecorView();
        ViewGroup contentView = (ViewGroup) decorView.findViewById(android.R.id.content);
        binding = Activity${activityClass?replace('Activity', '')}Binding.bind(contentView.getChildAt(0));
        getActivityComponent().inject(this);
        presenter.attachView(this);
    }

    @Override
    protected void initView() {

        binding.toolBar.removeAllViews();
        setSupportActionBar(binding.toolBar);

        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, binding.drawerlayout, binding.toolBar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        binding.drawerlayout.setDrawerListener(toggle);
        toggle.syncState();
        presenter.setNavigationItemSelectedListener(binding.sliderMenu);
        presenter.setupUI(binding.drawerlayout);
        
    <#if hasTabbar>
    	adapter = new ${activityClass}PagerAdapter(getSupportFragmentManager(), this);
        binding.setPagerAdapter(adapter);
        binding.setPresenter(presenter);
    <#else>
        presenter.onCreatedView(FragmentEnums.HOME, R.id.${layoutName}_frame_content);
    </#if>
    }

    @Override
    protected void initEvent() {
        
    }

<#if hasTabbar>
    @Override
    public void setCurrentItem(int position, boolean isSmooth) {
        binding.viewpager.setCurrentItem(position, isSmooth);
    }

    @Override
    public BaseFragment getCurrentFragment() {
        return adapter.getCurrentFragment();
    }

    @Override
    public String getActionBarTitle(int position) {
        return adapter.getActionBarTitle(position);
    }
</#if>

    @Override
    public void setActiveTitle(String title) {
        super.setActiveTitle(title);
//        binding.toolBar.setTitle(title);
    }

    public ToolBarPlus getToolbar() {
        return binding.toolBar;
    }

    @Override
    public Context getContext() {
        return this;
    }

    @Override
    public void resetView() {
        binding.toolBar.reset();
        Utils.hideSoftKeyboard(this);
        <#if hasTabbar>
        adapter.getCurrentFragment().setToolBar();
        adapter.getCurrentFragment().refresh(false);
        </#if>
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        <#if hasTabbar>
        adapter.getCurrentFragment().onActivityResult(requestCode, resultCode, data);
        </#if>
    }

    @Override
    public boolean hasTabBar() {
        return <#if hasTabbar>true<#else>false</#if>;
    }

    @Override
    public void closeDrawer() {
        binding.drawerlayout.closeDrawers();
    }
}
