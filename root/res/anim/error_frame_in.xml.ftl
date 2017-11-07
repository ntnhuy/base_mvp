<?xml version="1.0" encoding="utf-8"?>

<set xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:sweet="http://schemas.android.com/apk/res-auto"
    android:interpolator="@android:anim/linear_interpolator"
    android:shareInterpolator="true">

    <alpha
        android:duration="400"
        android:fromAlpha="0"
        android:toAlpha="1" />

    <sweet:${packageName}.widgets.SweetAlert.Rotate3dAnimation
        android:duration="400"
        sweet:fromDeg="100"
        sweet:pivotX="50%"
        sweet:pivotY="50%"
        sweet:rollType="x"
        sweet:toDeg="0" />
</set>