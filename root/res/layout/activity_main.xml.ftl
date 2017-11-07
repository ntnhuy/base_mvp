<?xml version="1.0" encoding="utf-8"?>
<android.support.v4.widget.DrawerLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:id="@+id/${layoutName}_drawerlayout"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:fitsSystemWindows="true">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical">

        <${packageName}.widgets.ToolBarPlus
            android:id="@+id/tool_bar"
            android:layout_width="match_parent"
            android:layout_height="?attr/actionBarSize"
            app:textColorTitle="@color/white">

        </${packageName}.widgets.ToolBarPlus>

    <#if hasTabbar>
        <RelativeLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent">

            <android.support.design.widget.TabLayout
                android:id="@+id/tabbar"
                android:layout_width="match_parent"
                android:layout_height="50dp"
            <#if positionOfTabbar == 'top'>
                android:layout_alignParentTop="true"
            <#else>
                android:layout_alignParentBottom="true"
            </#if>
                app:tabPaddingStart="-5dp"
                app:tabPaddingEnd="-5dp"
                app:tabIndicatorColor="@color/transparent"
                app:tabBackground="@color/colorPrimaryDark"
                app:tabTextColor="@color/gray_light"
                app:tabSelectedTextColor="@color/white"/>

            <View
                android:id="@+id/line"
                android:layout_width="match_parent"
            <#if positionOfTabbar == 'top'>
                android:layout_below="@+id/tabbar"
            <#else>
                android:layout_above="@+id/tabbar"
            </#if>
                android:layout_height="1dp"
                android:background="@drawable/tab_shadow"
                android:layout_gravity="top"/>

            <${packageName}.widgets.CustomViewPager
                android:id="@+id/viewpager"
                android:layout_width="match_parent"
                android:layout_height="match_parent"
            <#if positionOfTabbar == 'top'>
                android:layout_below="@+id/line"
            <#else>
                android:layout_above="@+id/line"
            </#if>
                android:overScrollMode="never"/>

        </RelativeLayout>
    <#else>    
        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:focusableInTouchMode="true"
            android:orientation="vertical">

            <LinearLayout
                android:id="@+id/${layoutName}_layout_content"
                android:layout_width="match_parent"
                android:layout_height="match_parent"
                android:orientation="vertical">

                <FrameLayout
                    android:id="@+id/${layoutName}_frame_content"
                    android:layout_width="match_parent"
                    android:layout_height="match_parent"/>

            </LinearLayout>

        </LinearLayout>
    </#if>

    </LinearLayout>

    <android.support.design.widget.NavigationView
        android:id="@+id/slider_menu"
        android:layout_width="wrap_content"
        android:layout_height="match_parent"
        android:layout_gravity="start"
        app:headerLayout="@layout/header_view"
        app:itemIconTint="@drawable/navigation_menu_selector"
        app:itemTextColor="@drawable/navigation_menu_selector"
        app:menu="@menu/navigation_menu" />

</android.support.v4.widget.DrawerLayout>
