<layout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:app="http://schemas.android.com/apk/res-auto"
        xmlns:tools="http://schemas.android.com/tools">
    
    <RelativeLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:background="@android:color/white">

        <${packageName}.widgets.TextViewPlus
            android:layout_width="match_parent"
            android:layout_height="40dp"
            android:layout_alignParentTop="true"
            android:gravity="center_vertical"
            android:paddingLeft="20dp"
            android:text="@string/welcome"
            android:textAppearance="?android:textAppearanceSmall" />

    </RelativeLayout>

</layout>