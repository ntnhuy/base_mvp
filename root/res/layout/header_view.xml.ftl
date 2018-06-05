<layout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:app="http://schemas.android.com/apk/res-auto"
        xmlns:tools="http://schemas.android.com/tools">
    
    <LinearLayout
        android:layout_height="@dimen/nav_header_height"
        android:layout_width="match_parent"
        android:background="@drawable/side_nav_bar"
        android:gravity="bottom"
        android:orientation="vertical"
        android:paddingBottom="@dimen/activity_vertical_margin"
        android:paddingLeft="@dimen/activity_horizontal_margin"
        android:paddingRight="@dimen/activity_horizontal_margin"
        android:paddingTop="@dimen/activity_vertical_margin"
        android:theme="@style/ThemeOverlay.AppCompat.Dark">

        <ImageView
            android:id="@+id/imageView"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:paddingTop="@dimen/nav_header_vertical_spacing"
            android:src="@android:drawable/sym_def_app_icon" />

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:paddingTop="@dimen/nav_header_vertical_spacing"
            android:text="Android Studio"
            android:textAppearance="@style/TextAppearance.AppCompat.Body1" />

        <TextView
            android:id="@+id/textView"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="android.studio@android.com" />

    </LinearLayout>

</layout>