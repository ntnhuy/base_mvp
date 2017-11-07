<resources>

    <!-- Base application theme. -->
    <style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
        <item name="android:windowBackground">@android:color/white</item>
        <item name="android:background">@android:color/transparent</item>
        <!--<item name="android:windowNoTitle">true</item>-->
        <!--<item name="android:windowFullscreen">true</item>-->
        <!--<item name="android:windowContentOverlay">@null</item>-->
        <item name="colorPrimary">@color/colorPrimary</item>
        <item name="colorPrimaryDark">@color/colorPrimaryDark</item>
        <item name="colorAccent">@color/colorAccent</item>
        <item name="drawerArrowStyle">@style/DrawerArrowStyle</item>
    </style>

    <style name="AppTheme.NoActionBar">
        <item name="windowActionBar">false</item>
        <item name="windowNoTitle">true</item>
    </style>

    <style name="AppTheme.AppBarOverlay" parent="ThemeOverlay.AppCompat.Dark.ActionBar" />

    <style name="AppTheme.PopupOverlay" parent="ThemeOverlay.AppCompat.Light" />

    <style name="DrawerArrowStyle" parent="Widget.AppCompat.DrawerArrowToggle">
        <item name="color">@android:color/white</item>
    </style>

    <style name="alert_dialog" parent="android:Theme.Dialog">
        <item name="android:windowIsFloating">true</item>
        <item name="android:windowIsTranslucent">false</item>
        <item name="android:windowNoTitle">true</item>
        <item name="android:windowFullscreen">false</item>
        <item name="android:windowBackground">@color/float_transparent</item>
        <item name="android:windowAnimationStyle">@null</item>
        <item name="android:backgroundDimEnabled">true</item>
        <item name="android:backgroundDimAmount">0.4</item>
    </style>

    <style name="dialog_blue_button" parent="android:Widget.Button">
        <item name="android:layout_width">wrap_content</item>
        <item name="android:layout_height">31dp</item>
        <item name="android:background">@drawable/blue_button_background</item>
        <item name="android:textSize">14sp</item>
        <item name="android:paddingLeft">21dp</item>
        <item name="android:paddingRight">21dp</item>
        <item name="android:textColor">@color/button_text_color</item>
    </style>

    <style name="genderSwitchStyle">
        <item name="track">@drawable/switch_track_green</item>
        <item name="thumb">@drawable/background_fenced</item>
        <item name="switchTextAppearanceAttrib">@style/genderSwitchTextAppearance</item>
        <item name="textOn">ON</item>
        <item name="textOff">OFF</item>
        <item name="pushStyle">false</item>
        <item name="textOnThumb">true</item>
        <item name="thumbExtraMovement">0dp</item>
        <item name="switchMinWidth">69dp</item>
        <item name="switchMinHeight">36dp</item>
    </style>

    <style name="genderSwitchTextAppearance">
        <item name="textColor">#FFeeFFee</item>
        <item name="textColorHighlight">#FFeeFFee</item>
        <item name="textColorHint">#FFeeFFee</item>
        <item name="textColorLink">#FFeeFFee</item>
        <item name="textSize">16sp</item>
        <item name="textStyle">normal</item>
    </style>

    <style name="Widget.FloatLabel" parent="android:TextAppearance.Medium">
        <item name="android:layout_width">match_parent</item>
        <item name="android:layout_height">wrap_content</item>
        <item name="android:gravity">center</item>
    </style>

    <style name="FadeInPopWin">
        <item name="android:backgroundDimEnabled">true</item>
        <item name="android:windowEnterAnimation">@anim/pop_win_content_fade_in</item>
        <item name="android:windowExitAnimation">@anim/pop_win_content_fade_out</item>
    </style>

    <style name="foodRatingBar" parent="@android:style/Widget.RatingBar">
        <item name="android:progressDrawable">@drawable/ratingstars</item>
        <item name="android:minHeight">140px</item>
        <item name="android:maxHeight">140px</item>
    </style>

    <style name="RatingBar" parent="Theme.AppCompat">
        <item name="colorControlNormal">@color/white</item>
        <item name="android:secondaryProgress">@color/yellow</item>
        <item name="colorControlActivated">@color/white</item>
    </style>

    <style name="dialog" parent="@android:style/Theme.DeviceDefault.Dialog">
        <item name="android:windowIsTranslucent">false</item>
        <item name="android:windowBackground">@android:color/darker_gray</item>
        <item name="android:windowNoTitle">true</item>
        <item name="android:backgroundDimEnabled">true</item>
        <item name="android:windowIsFloating">false</item>
    </style>

</resources>
