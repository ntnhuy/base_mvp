<?xml version="1.0"?>
<recipe>
	
	<merge from="build-global.gradle.ftl" to="${escapeXmlAttribute(topOut)}/build.gradle" />
    <merge from="build.gradle.ftl" to="${escapeXmlAttribute(projectOut)}/build.gradle" />
    <merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
			 
	<instantiate from="src/app_package/Application.java.ftl" to="${escapeXmlAttribute(srcOut)}/${classApplication}.java"/>
	
	<instantiate from="src/app_package/adapters/BaseAdapter.java.ftl" to="${escapeXmlAttribute(srcOut)}/adapters/BaseAdapter.java"/>

	<instantiate from="src/app_package/adapters/PaginatableAdapter.java.ftl" to="${escapeXmlAttribute(srcOut)}/adapters/PaginatableAdapter.java"/>

<#if includeGA || includeFabric>
	<instantiate from="src/app_package/analyticss/AnalyticsManager.java.ftl" to="${escapeXmlAttribute(srcOut)}/analyticss/AnalyticsManager.java"/>

	<instantiate from="src/app_package/analyticss/AppAnalyticsManager.java.ftl" to="${escapeXmlAttribute(srcOut)}/analyticss/AppAnalyticsManager.java"/>

	<instantiate from="src/app_package/app/di/module/AnalyticsModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/module/AnalyticsModule.java"/>
<#if includeFabric>
	<instantiate from="src/app_package/analyticss/crashlytics/AppCrashlyticsHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/analyticss/crashlytics/AppCrashlyticsHelper.java"/>

	<instantiate from="src/app_package/analyticss/crashlytics/CrashlyticsHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/analyticss/crashlytics/CrashlyticsHelper.java"/>
</#if>

<#if includeGA>
	<instantiate from="src/app_package/analyticss/ga/AppGAHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/analyticss/ga/AppGAHelper.java"/>

	<instantiate from="src/app_package/analyticss/ga/GAHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/analyticss/ga/GAHelper.java"/>

	<instantiate from="src/app_package/app/di/TrackerInfo.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/TrackerInfo.java"/>
</#if>
</#if>
	
<#if includeRetrofit || includeDB>
	<instantiate from="src/app_package/datas/rx/AppSchedulerProvider.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/rx/AppSchedulerProvider.java"/>

	<instantiate from="src/app_package/datas/rx/SchedulerProvider.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/rx/SchedulerProvider.java"/>

	<instantiate from="src/app_package/app/di/module/RxModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/module/RxModule.java"/>

<#if includeDB>
	<instantiate from="src/app_package/app/di/DatabaseInfo.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/DatabaseInfo.java"/>

	<instantiate from="src/app_package/app/di/module/DBModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/module/DBModule.java"/>

	<instantiate from="src/app_package/datas/db/AppDbHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/db/AppDbHelper.java"/>

	<instantiate from="src/app_package/datas/db/DbHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/db/DbHelper.java"/>

	<instantiate from="src/app_package/datas/db/DbOpenHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/db/DbOpenHelper.java"/>

	<instantiate from="src/app_package/datas/models/User.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/models/User.java"/>
</#if>

<#if includeRetrofit>
	<instantiate from="src/app_package/app/di/module/ApiModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/module/ApiModule.java"/>

	<instantiate from="src/app_package/datas/api/ApiHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/api/ApiHelper.java"/>

	<instantiate from="src/app_package/datas/api/BaseRequestInterceptor.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/api/${classApplication}RequestInterceptor.java"/>

	<instantiate from="src/app_package/datas/api/BaseService.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/api/${classApplication}Service.java"/>

	<instantiate from="src/app_package/utils/ToStringConverterFactory.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/ToStringConverterFactory.java"/>
</#if>
</#if>

<#if hasTabbar>
	<instantiate from="src/app_package/adapters/MainActivityPagerAdapter.java.ftl" to="${escapeXmlAttribute(srcOut)}/adapters/${activityClass}PagerAdapter.java"/>
</#if>

	<instantiate from="src/app_package/app/di/module/AppModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/module/AppModule.java"/>

	<instantiate from="src/app_package/app/bases/BaseActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BaseActivity.java"/>

	<instantiate from="src/app_package/app/bases/BaseActivityPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BaseActivityPresenter.java"/>

	<instantiate from="src/app_package/app/bases/BaseActivityView.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BaseActivityView.java"/>

	<instantiate from="src/app_package/app/bases/BaseDialogFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BaseDialogFragment.java"/>

	<instantiate from="src/app_package/app/bases/BaseFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BaseFragment.java"/>

	<instantiate from="src/app_package/app/bases/BaseModel.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BaseModel.java"/>

	<instantiate from="src/app_package/app/bases/BasePresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/BasePresenter.java"/>

	<instantiate from="src/app_package/app/bases/MvpView.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/MvpView.java"/>

	<instantiate from="src/app_package/app/bases/Presenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/bases/Presenter.java"/>

	<instantiate from="src/app_package/app/di/ApplicationContext.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/ApplicationContext.java"/>

	<instantiate from="src/app_package/app/di/component/ActivityComponent.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/component/ActivityComponent.java"/>

	<instantiate from="src/app_package/app/di/component/AppComponent.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/component/AppComponent.java"/>

	<instantiate from="src/app_package/app/di/component/FragmentComponent.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/component/FragmentComponent.java"/>

	<instantiate from="src/app_package/app/di/component/ViewComponent.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/component/ViewComponent.java"/>

	<instantiate from="src/app_package/app/di/module/PreferenceModule.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/module/PreferenceModule.java"/>

	<instantiate from="src/app_package/app/di/PreferenceInfo.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/PreferenceInfo.java"/>

	<instantiate from="src/app_package/app/di/scopes/UserScope.java.ftl" to="${escapeXmlAttribute(srcOut)}/app/di/scopes/UserScope.java"/>

	<instantiate from="src/app_package/datas/models/EventBusModel.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/models/EventBusModel.java"/>

	<instantiate from="src/app_package/datas/AppDataManager.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/AppDataManager.java"/>

	<instantiate from="src/app_package/datas/DataManager.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/DataManager.java"/>

	<instantiate from="src/app_package/datas/prefs/AppPreferencesHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/prefs/AppPreferencesHelper.java"/>

	<instantiate from="src/app_package/datas/prefs/PreferencesHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/datas/prefs/PreferencesHelper.java"/>

	<instantiate from="src/app_package/enums/EventBusEnum.java.ftl" to="${escapeXmlAttribute(srcOut)}/enums/EventBusEnum.java"/>

	<instantiate from="src/app_package/enums/FragmentEnums.java.ftl" to="${escapeXmlAttribute(srcOut)}/enums/FragmentEnums.java"/>

	<instantiate from="src/app_package/listeners/IEnterText.java.ftl" to="${escapeXmlAttribute(srcOut)}/listeners/IEnterText.java"/>

	<instantiate from="src/app_package/listeners/OnBackListener.java.ftl" to="${escapeXmlAttribute(srcOut)}/listeners/OnBackListener.java"/>

	<instantiate from="src/app_package/listeners/OnClickLeftMenuListener.java.ftl" to="${escapeXmlAttribute(srcOut)}/listeners/OnClickLeftMenuListener.java"/>

	<instantiate from="src/app_package/listeners/OnClickRightMenuListener.java.ftl" to="${escapeXmlAttribute(srcOut)}/listeners/OnClickRightMenuListener.java"/>

	<instantiate from="src/app_package/listeners/OnCloseListener.java.ftl" to="${escapeXmlAttribute(srcOut)}/listeners/OnCloseListener.java"/>

	<instantiate from="src/app_package/listeners/OnDismissDialog.java.ftl" to="${escapeXmlAttribute(srcOut)}/listeners/OnDismissDialog.java"/>

	<instantiate from="src/app_package/receivers/GPSChangeReceiver.java.ftl" to="${escapeXmlAttribute(srcOut)}/receivers/GPSChangeReceiver.java"/>

	<instantiate from="src/app_package/receivers/NetworkChangeReceiver.java.ftl" to="${escapeXmlAttribute(srcOut)}/receivers/NetworkChangeReceiver.java"/>

	<instantiate from="src/app_package/ui/activities/main/MainActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/activities/main/${activityClass}.java"/>

	<instantiate from="src/app_package/ui/activities/main/MainPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/activities/main/${activityClass?replace('Activity', '')}Presenter.java"/>

	<instantiate from="src/app_package/ui/activities/main/MainView.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/activities/main/${activityClass?replace('Activity', '')}View.java"/>

	<instantiate from="src/app_package/ui/activities/splash/SplashActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/activities/splash/SplashActivity.java"/>

	<instantiate from="src/app_package/ui/activities/splash/SplashPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/activities/splash/SplashPresenter.java"/>

	<instantiate from="src/app_package/ui/activities/splash/SplashView.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/activities/splash/SplashView.java"/>

	<instantiate from="src/app_package/ui/dialogs/BaseDialog.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/dialogs/BaseDialog.java"/>

	<instantiate from="src/app_package/ui/dialogs/BaseDialogMvp.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/dialogs/BaseDialogMvp.java"/>

	<instantiate from="src/app_package/ui/dialogs/BaseDialogPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/dialogs/BaseDialogPresenter.java"/>

	<instantiate from="src/app_package/ui/fragments/home/HomeFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/fragments/home/HomeFragment.java"/>

	<instantiate from="src/app_package/ui/fragments/home/HomePresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/fragments/home/HomePresenter.java"/>

	<instantiate from="src/app_package/ui/fragments/home/HomeView.java.ftl" to="${escapeXmlAttribute(srcOut)}/ui/fragments/home/HomeView.java"/>

	<instantiate from="src/app_package/utils/Constants.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/Constants.java"/>

	<instantiate from="src/app_package/utils/NetworkUtil.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/NetworkUtil.java"/>

	<instantiate from="src/app_package/utils/TextWatcherPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/TextWatcherPlus.java"/>

	<instantiate from="src/app_package/utils/ToastUtils.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/ToastUtils.java"/>

	<instantiate from="src/app_package/utils/Utils.java.ftl" to="${escapeXmlAttribute(srcOut)}/utils/Utils.java"/>

	<instantiate from="src/app_package/widgets/AnimatedExpandableListView.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/AnimatedExpandableListView.java"/>

	<instantiate from="src/app_package/widgets/ButtonPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/ButtonPlus.java"/>

	<instantiate from="src/app_package/widgets/CustomViewPager.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/CustomViewPager.java"/>

	<instantiate from="src/app_package/widgets/EditTextPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/EditTextPlus.java"/>

	<instantiate from="src/app_package/widgets/EmptyRecyclerView.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/EmptyRecyclerView.java"/>

	<instantiate from="src/app_package/widgets/GenderSwitch.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/GenderSwitch.java"/>

	<instantiate from="src/app_package/widgets/iconWithNotification/IconWithNotification.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/iconWithNotification/IconWithNotification.java"/>

	<instantiate from="src/app_package/widgets/iconWithNotification/IconWithNotificationPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/iconWithNotification/IconWithNotificationPresenter.java"/>

	<instantiate from="src/app_package/widgets/iconWithNotification/IconWithNotificationView.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/iconWithNotification/IconWithNotificationView.java"/>

	<instantiate from="src/app_package/widgets/PullDownToRefresh.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/PullDownToRefresh.java"/>

	<instantiate from="src/app_package/widgets/recyclerViewPlus/RecyclerViewPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/recyclerViewPlus/RecyclerViewPlus.java"/>

	<instantiate from="src/app_package/widgets/recyclerViewPlus/RecyclerViewPlusPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/recyclerViewPlus/RecyclerViewPlusPresenter.java"/>

	<instantiate from="src/app_package/widgets/recyclerViewPlus/RecyclerViewPlusView.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/recyclerViewPlus/RecyclerViewPlusView.java"/>

	<instantiate from="src/app_package/widgets/SpacingItemDecoration.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SpacingItemDecoration.java"/>

	<instantiate from="src/app_package/widgets/SweetAlert/OptAnimationLoader.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SweetAlert/OptAnimationLoader.java"/>

	<instantiate from="src/app_package/widgets/SweetAlert/ProgressHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SweetAlert/ProgressHelper.java"/>

	<instantiate from="src/app_package/widgets/SweetAlert/ProgressWheel.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SweetAlert/ProgressWheel.java"/>

	<instantiate from="src/app_package/widgets/SweetAlert/Rotate3dAnimation.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SweetAlert/Rotate3dAnimation.java"/>

	<instantiate from="src/app_package/widgets/SweetAlert/SuccessTickView.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SweetAlert/SuccessTickView.java"/>

	<instantiate from="src/app_package/widgets/SweetAlert/SweetAlertDialog.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/SweetAlert/SweetAlertDialog.java"/>

	<instantiate from="src/app_package/widgets/TextInputLayoutPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/TextInputLayoutPlus.java"/>

	<instantiate from="src/app_package/widgets/TextViewPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/TextViewPlus.java"/>

	<instantiate from="src/app_package/widgets/ToolBarPlus.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/ToolBarPlus.java"/>

	<instantiate from="src/app_package/widgets/TransitionDrawableImageView.java.ftl" to="${escapeXmlAttribute(srcOut)}/widgets/TransitionDrawableImageView.java"/>

	<instantiate from="res/layout/activity_splash.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/activity_splash.xml"/>
	
	<instantiate from="res/layout/activity_main.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml"/>

	<instantiate from="res/layout/alert_dialog.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/alert_dialog.xml"/>

	<instantiate from="res/layout/dialog_frag_test_base.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/dialog_frag_test_base.xml"/>

	<instantiate from="res/layout/fragment_home.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/fragment_home.xml"/>

	<instantiate from="res/layout/header_view.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/header_view.xml"/>

	<copy from="res/anim/activity_close_scale.xml" to="${escapeXmlAttribute(resOut)}/anim/activity_close_scale.xml"/>

	<copy from="res/anim/activity_open_translate.xml" to="${escapeXmlAttribute(resOut)}/anim/activity_open_translate.xml"/>

	<instantiate from="res/anim/error_frame_in.xml.ftl" to="${escapeXmlAttribute(resOut)}/anim/error_frame_in.xml"/>

	<copy from="res/anim/error_x_in.xml" to="${escapeXmlAttribute(resOut)}/anim/error_x_in.xml"/>

	<copy from="res/anim/fade_in.xml" to="${escapeXmlAttribute(resOut)}/anim/fade_in.xml"/>

	<copy from="res/anim/fade_out.xml" to="${escapeXmlAttribute(resOut)}/anim/fade_out.xml"/>

	<copy from="res/anim/modal_in.xml" to="${escapeXmlAttribute(resOut)}/anim/modal_in.xml"/>

	<copy from="res/anim/modal_out.xml" to="${escapeXmlAttribute(resOut)}/anim/modal_out.xml"/>

	<copy from="res/anim/next.xml" to="${escapeXmlAttribute(resOut)}/anim/next.xml"/>

	<copy from="res/anim/pop_win_content_fade_in.xml" to="${escapeXmlAttribute(resOut)}/anim/pop_win_content_fade_in.xml"/>

	<copy from="res/anim/pop_win_content_fade_out.xml" to="${escapeXmlAttribute(resOut)}/anim/pop_win_content_fade_out.xml"/>

	<copy from="res/anim/previous.xml" to="${escapeXmlAttribute(resOut)}/anim/previous.xml"/>

	<copy from="res/anim/success_bow_roate.xml" to="${escapeXmlAttribute(resOut)}/anim/success_bow_roate.xml"/>

	<copy from="res/anim/success_mask_layout.xml" to="${escapeXmlAttribute(resOut)}/anim/success_mask_layout.xml"/>

	<copy from="res/animator/content_fade_in.xml" to="${escapeXmlAttribute(resOut)}/animator/content_fade_in.xml"/>

	<copy from="res/animator/content_fade_out.xml" to="${escapeXmlAttribute(resOut)}/animator/content_fade_out.xml"/>

	<copy from="res/drawable/background_fenced.xml" to="${escapeXmlAttribute(resOut)}/drawable/background_fenced.xml"/>

	<copy from="res/drawable/badge_circle.xml" to="${escapeXmlAttribute(resOut)}/drawable/badge_circle.xml"/>

	<copy from="res/drawable/bg_dialog_test_base.xml" to="${escapeXmlAttribute(resOut)}/drawable/bg_dialog_test_base.xml"/>

	<copy from="res/drawable/bg_loading_circle.xml" to="${escapeXmlAttribute(resOut)}/drawable/bg_loading_circle.xml"/>

	<copy from="res/drawable/bg_loading_rect.xml" to="${escapeXmlAttribute(resOut)}/drawable/bg_loading_rect.xml"/>

	<copy from="res/drawable/blue_button_background.xml" to="${escapeXmlAttribute(resOut)}/drawable/blue_button_background.xml"/>

	<copy from="res/drawable/default_dot.xml" to="${escapeXmlAttribute(resOut)}/drawable/default_dot.xml"/>

	<copy from="res/drawable/dialog_background.xml" to="${escapeXmlAttribute(resOut)}/drawable/dialog_background.xml"/>

	<copy from="res/drawable/drawable_transparent_clickable.xml" to="${escapeXmlAttribute(resOut)}/drawable/drawable_transparent_clickable.xml"/>

	<copy from="res/drawable/drawable_view_notification_text.xml" to="${escapeXmlAttribute(resOut)}/drawable/drawable_view_notification_text.xml"/>

	<copy from="res/drawable/error_center_x.xml" to="${escapeXmlAttribute(resOut)}/drawable/error_center_x.xml"/>

	<copy from="res/drawable/error_circle.xml" to="${escapeXmlAttribute(resOut)}/drawable/error_circle.xml"/>

	<copy from="res/drawable/gray_button_background.xml" to="${escapeXmlAttribute(resOut)}/drawable/gray_button_background.xml"/>

	<copy from="res/drawable/ic_back_black.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_back_black.xml"/>

	<copy from="res/drawable/ic_back_white.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_back_white.xml"/>

	<copy from="res/drawable/ic_close_black.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_close_black.xml"/>

	<copy from="res/drawable/ic_close_white.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_close_white.xml"/>

	<copy from="res/drawable/ic_completed.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_completed.xml"/>

	<copy from="res/drawable/ic_error.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_error.xml"/>

	<copy from="res/drawable/ic_home.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_home.xml"/>

	<copy from="res/drawable/ic_list_pressed.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_list_pressed.xml"/>

	<copy from="res/drawable/ic_list.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_list.xml"/>

	<copy from="res/drawable/ic_logout.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_logout.xml"/>

	<copy from="res/drawable/ic_next.xml" to="${escapeXmlAttribute(resOut)}/drawable/ic_next.xml"/>

	<copy from="res/drawable/navigation_menu_selector.xml" to="${escapeXmlAttribute(resOut)}/drawable/navigation_menu_selector.xml"/>

	<copy from="res/drawable/ratingstars.xml" to="${escapeXmlAttribute(resOut)}/drawable/ratingstars.xml"/>

	<copy from="res/drawable/red_button_background.xml" to="${escapeXmlAttribute(resOut)}/drawable/red_button_background.xml"/>

	<copy from="res/drawable/selected_dot.xml" to="${escapeXmlAttribute(resOut)}/drawable/selected_dot.xml"/>

	<copy from="res/drawable/shadow_bottom.xml" to="${escapeXmlAttribute(resOut)}/drawable/shadow_bottom.xml"/>

	<copy from="res/drawable/side_nav_bar.xml" to="${escapeXmlAttribute(resOut)}/drawable/side_nav_bar.xml"/>

	<copy from="res/drawable/success_bow.xml" to="${escapeXmlAttribute(resOut)}/drawable/success_bow.xml"/>

	<copy from="res/drawable/success_circle.xml" to="${escapeXmlAttribute(resOut)}/drawable/success_circle.xml"/>

	<copy from="res/drawable/switch_track_green.xml" to="${escapeXmlAttribute(resOut)}/drawable/switch_track_green.xml"/>

	<copy from="res/drawable/tab_selector.xml" to="${escapeXmlAttribute(resOut)}/drawable/tab_selector.xml"/>

	<copy from="res/drawable/tab_shadow.xml" to="${escapeXmlAttribute(resOut)}/drawable/tab_shadow.xml"/>

	<copy from="res/drawable/warning_circle.xml" to="${escapeXmlAttribute(resOut)}/drawable/warning_circle.xml"/>

	<copy from="res/drawable/warning_sigh.xml" to="${escapeXmlAttribute(resOut)}/drawable/warning_sigh.xml"/>

	<copy from="res/menu/menu_main.xml" to="${escapeXmlAttribute(resOut)}/menu/menu_main.xml"/>

	<copy from="res/menu/navigation_menu.xml" to="${escapeXmlAttribute(resOut)}/menu/navigation_menu.xml"/>

	<copy from="res/mipmap-hdpi/splash.png" to="${escapeXmlAttribute(resOut)}/mipmap-hdpi/splash.png"/>

	<copy from="res/values/attrs.xml" to="${escapeXmlAttribute(resOut)}/values/attrs.xml"/>

	<merge from="res/values/colors.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/colors.xml" />

	<copy from="res/values/dimens.xml" to="${escapeXmlAttribute(resOut)}/values/dimens.xml"/>

	<copy from="res/values/ids.xml" to="${escapeXmlAttribute(resOut)}/values/ids.xml"/>

	<instantiate from="res/values/integer.xml" to="${escapeXmlAttribute(resOut)}/values/integer.xml"/>
	
    <merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />   

    <merge from="res/values/styles.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/styles.xml"/>

    <open file="${escapeXmlAttribute(srcOut)}/ui/activities/main/${activityClass}.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
</recipe>
