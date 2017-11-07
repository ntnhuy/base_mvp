package ${packageName}.utils;

import android.widget.Toast;

import ${packageName}.${classApplication};


public class ToastUtils {

    public static void showShort(String message) {
        Toast.makeText(${classApplication}.getInstance(), message, Toast.LENGTH_SHORT).show();
    }

    public static void showShort(int resId) {
        Toast.makeText(${classApplication}.getInstance(), resId, Toast.LENGTH_SHORT).show();
    }

    public static void showLong(String message) {
        Toast.makeText(${classApplication}.getInstance(), message, Toast.LENGTH_LONG).show();
    }

    public static void showLong(int resId) {
        Toast.makeText(${classApplication}.getInstance(), resId, Toast.LENGTH_LONG).show();
    }
}
