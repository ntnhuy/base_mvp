<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/container"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:clickable="true"
    android:orientation="vertical">

    <FrameLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:layout_marginBottom="48dp"
        android:layout_marginLeft="24dp"
        android:layout_marginRight="24dp"
        android:layout_marginTop="48dp"
        android:padding="5dp"
        android:background="@drawable/bg_dialog_test_base"
        android:clickable="true"
        >

        <LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="@android:color/white"
            android:orientation="vertical">

            <RelativeLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content">
                <ImageView
                    android:id="@+id/iv_left"
                    android:layout_width="17dp"
                    android:layout_height="17dp"
                    android:layout_alignParentLeft="true"
                    android:layout_alignParentTop="true"
                    android:layout_margin="10dp"
                    android:src="@drawable/ic_close_black"
                    android:visibility="gone" />

                <${packageName}.widgets.TextViewPlus
                    android:id="@+id/tv_title"
                    android:textStyle="bold"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content"
                    android:layout_centerHorizontal="true"
                    android:textColor="@color/text_color"
                    android:layout_margin="10dp" />

                <ImageView
                    android:id="@+id/iv_right"
                    android:layout_width="17dp"
                    android:layout_height="17dp"
                    android:layout_alignParentRight="true"
                    android:layout_alignParentTop="true"
                    android:layout_margin="10dp"
                    android:src="@drawable/ic_close_black" />

            </RelativeLayout>

            <View
                android:layout_marginLeft="-5dp"
                android:layout_marginRight="-5dp"
                android:layout_width="match_parent"
                android:layout_height="0.6dp"
                android:background="@color/gray_light"/>

            <${packageName}.widgets.TextViewPlus
                android:id="@+id/tv_content"
                android:layout_width="match_parent"
                android:layout_height="80dp"
                android:gravity="center"
                android:textColor="@color/text_color"
                />

            <LinearLayout
                android:id="@+id/ll_confirm"
                android:layout_width="match_parent"
                android:layout_height="48dp"
                android:layout_gravity="center_horizontal"
                android:layout_marginBottom="8dp"
                android:layout_marginTop="8dp"
                android:orientation="horizontal">

                <${packageName}.widgets.ButtonPlus
                    android:id="@+id/btn_cancel"
                    android:layout_width="0dp"
                    android:layout_height="match_parent"
                    android:layout_weight=".5"
                    android:background="@android:color/transparent"
                    android:gravity="center"
                    android:text="Cancel"
                    android:textSize="7pt"
                    android:textColor="@android:color/holo_blue_dark"
                    android:textStyle="bold" />

                <${packageName}.widgets.ButtonPlus
                    android:id="@+id/btn_ok"
                    android:layout_width="0dp"
                    android:layout_height="match_parent"
                    android:layout_weight=".5"
                    android:textSize="7pt"
                    android:background="@android:color/transparent"
                    android:gravity="center"
                    android:text="Ok"
                    android:textColor="@android:color/holo_blue_dark"
                    android:textStyle="bold" />
            </LinearLayout>
        </LinearLayout>
    </FrameLayout>

</FrameLayout>