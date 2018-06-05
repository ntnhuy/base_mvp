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

public class ${activityClass} extends BaseActivity implements ${activityClass?replace('Activity', '')}View {

<#if hasTabbar>
    private ${activityClass}PagerAdapter mMainAdapter;
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
        setupTabLayout();

        mMainAdapter = new ${activityClass}PagerAdapter(getSupportFragmentManager(), this);
        binding.viewpager.setAdapter(mMainAdapter);
        binding.viewpager.setSwipEnable(false);
//        binding.viewpager.addOnPageChangeListener(this);
        binding.viewpager.setOffscreenPageLimit(2);

        presenter.selectTab(binding.tabbar.getTabAt(0), false);
    <#else>
        presenter.onCreatedView(FragmentEnums.HOME, R.id.${layoutName}_frame_content);
    </#if>
    }

    @Override
    protected void initEvent() {
    <#if hasTabbar>
        binding.tabbar.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {

            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                presenter.unSelectLastActiveTab(binding.tabbar);
                presenter.selectTab(tab, true);
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {
                presenter.unSelectLastActiveTab(binding.tabbar);
            }

            @Override
            public void onTabReselected(TabLayout.Tab tab) {
                onTabSelected(tab);
            }
        });
    </#if>
    }

<#if hasTabbar>
    private void setupTabLayout() {
        binding.tabbar.addTab(binding.tabbar.newTab().setText(R.string.tab1));

        binding.tabbar.addTab(binding.tabbar.newTab().setText(R.string.tab2));
    }

    @Override
    public void selectTab(int position) {
        presenter.unSelectLastActiveTab(binding.tabbar);
        presenter.selectTab(binding.tabbar.getTabAt(position), false);
    }

    @Override
    public void setCurrentItem(int position, boolean isSmooth) {
        binding.viewpager.setCurrentItem(position, isSmooth);
    }

    @Override
    public BaseFragment getCurrentFragment() {
        return mMainAdapter.getCurrentFragment();
    }

    @Override
    public String getActionBarTitle(int position) {
        return mMainAdapter.getActionBarTitle(position);
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
        mMainAdapter.getCurrentFragment().setToolBar();
        mMainAdapter.getCurrentFragment().refresh(false);
        </#if>
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        <#if hasTabbar>
        mMainAdapter.getCurrentFragment().onActivityResult(requestCode, resultCode, data);
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
