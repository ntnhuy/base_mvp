package ${packageName}.ui.activities.main;

import android.content.Context;
import android.content.Intent;
import android.support.design.widget.NavigationView;
import android.support.design.widget.TabLayout;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.os.Bundle;

import ${packageName}.R;
<#if hasTabbar>
import ${packageName}.adapters.${activityClass}PagerAdapter;
import ${packageName}.widgets.CustomViewPager;
<#else>
import ${packageName}.enums.FragmentEnums;
</#if>
import ${packageName}.app.bases.BaseActivity;
import ${packageName}.app.bases.BaseFragment;
import ${packageName}.widgets.ToolBarPlus;
import ${packageName}.utils.Utils;

import javax.inject.Inject;

import butterknife.BindView;

public class ${activityClass} extends BaseActivity implements ${activityClass?replace('Activity', '')}View {

    @BindView(R.id.${layoutName}_drawerlayout)
    DrawerLayout mDrawerLayout;
    @BindView(R.id.tool_bar)
    ToolBarPlus toolBar;
    <#if hasTabbar>
    @BindView(R.id.tabbar)
    TabLayout tabLayout;
    @BindView(R.id.viewpager)
    CustomViewPager viewPager;
    </#if>
    @BindView(R.id.slider_menu)
    NavigationView navigationView;

<#if hasTabbar>
    private ${activityClass}PagerAdapter mMainAdapter;
</#if>
    @Inject
    public ${activityClass?replace('Activity', '')}Presenter presenter;

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
        getActivityComponent().inject(this);
        presenter.attachView(this);
    }

    @Override
    protected void initView() {

        toolBar.removeAllViews();
        setSupportActionBar(toolBar);

        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(this, mDrawerLayout, toolBar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        mDrawerLayout.setDrawerListener(toggle);
        toggle.syncState();
        presenter.setNavigationItemSelectedListener(navigationView);
        presenter.setupUI(mDrawerLayout);
        
    <#if hasTabbar>
        setupTabLayout();

        mMainAdapter = new ${activityClass}PagerAdapter(getSupportFragmentManager(), this);
        viewPager.setAdapter(mMainAdapter);
        viewPager.setSwipEnable(false);
//        viewPager.addOnPageChangeListener(this);
        viewPager.setOffscreenPageLimit(2);

        presenter.selectTab(tabLayout.getTabAt(0), false);
    <#else>
        presenter.onCreatedView(getSupportFragmentManager(), FragmentEnums.HOME, R.id.${layoutName}_frame_content);
    </#if>
    }

    @Override
    protected void initEvent() {
    <#if hasTabbar>
        tabLayout.addOnTabSelectedListener(new TabLayout.OnTabSelectedListener() {

            @Override
            public void onTabSelected(TabLayout.Tab tab) {
                presenter.unSelectLastActiveTab(tabLayout);
                presenter.selectTab(tab, true);
            }

            @Override
            public void onTabUnselected(TabLayout.Tab tab) {
                presenter.unSelectLastActiveTab(tabLayout);
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
        tabLayout.addTab(tabLayout.newTab().setText(R.string.tab1));

        tabLayout.addTab(tabLayout.newTab().setText(R.string.tab2));
    }

    @Override
    public void selectTab(int position) {
        presenter.unSelectLastActiveTab(tabLayout);
        presenter.selectTab(tabLayout.getTabAt(position), false);
    }

    @Override
    public void setCurrentItem(int position, boolean isSmooth) {
        viewPager.setCurrentItem(position, isSmooth);
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
//        toolBar.setTitle(title);
    }

    public ToolBarPlus getToolbar() {
        return toolBar;
    }

    @Override
    public Context getContext() {
        return this;
    }

    @Override
    public void resetView() {
        toolBar.reset();
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
        mDrawerLayout.closeDrawers();
    }
}
