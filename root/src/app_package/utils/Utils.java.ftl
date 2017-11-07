package ${packageName}.utils;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.ListView;

import ${packageName}.${classApplication};
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.squareup.picasso.Downloader;
import com.squareup.picasso.LruCache;
import com.squareup.picasso.OkHttpDownloader;
import com.squareup.picasso.Picasso;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Hashtable;
import android.graphics.Typeface;
<#if includeRetrofit>
import retrofit2.Response;
</#if>

/**
 * Created by ntnhuy  on 11/18/15.
 */
public class Utils {

    public static final String TAG = "Utils";
    public static final int DEFAULT_BUFFER_SIZE = 8192;
    private static String sFormatEmail = "^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,4}$";
    private static Picasso picasso;

    /**
     * @return true if JellyBean or higher
     */
    public static boolean isJellyBeanOrHigher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN;
    }

    /**
     * @return true if Ice Cream or higher
     */
    public static boolean isICSOrHigher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH;
    }

    /**
     * @return true if HoneyComb or higher
     */
    public static boolean isHoneycombOrHigher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB;
    }

    /**
     * @return true if GingerBreak or higher
     */
    public static boolean isGingerbreadOrHigher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.GINGERBREAD;
    }

    /**
     * @return true if Froyo or higher
     */
    public static boolean isFroyoOrHigher() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.FROYO;
    }

    /**
     * Check SdCard
     *
     * @return true if External Strorage available
     */
    public static boolean isExtStorageAvailable() {
        return Environment.MEDIA_MOUNTED.equals(Environment
                .getExternalStorageState());
    }

    /**
     * Check internet
     *
     * @return true if Network connected
     */
    public static boolean isNetworkConnected(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context
                .getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager
                .getActiveNetworkInfo();
        if (activeNetworkInfo != null) {
            return activeNetworkInfo.isConnected();
        }
        return false;
    }

    public static boolean isInternetAvailable() {
        try {
            InetAddress ipAddr =
                    InetAddress.getByName("google.com"); //You can replace it with your name

            if (ipAddr.equals("")) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Check wifi
     *
     * @return true if Wifi connected
     */
    public static boolean isWifiConnected(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context
                .getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo wifiNetworkInfo = connectivityManager
                .getNetworkInfo(ConnectivityManager.TYPE_WIFI);
        if (wifiNetworkInfo != null) {
            return wifiNetworkInfo.isConnected();
        }
        return false;
    }

    /**
     * Check on/off gps
     *
     * @return true if GPS available
     */
    public static boolean checkAvailableGps(Context context) {
        LocationManager manager = (LocationManager) context
                .getSystemService(Context.LOCATION_SERVICE);

        return manager.isProviderEnabled(LocationManager.GPS_PROVIDER);
    }

    /**
     * Check an email is valid or not
     *
     * @param email the email need to check
     * @return {@code true} if valid, {@code false} if invalid
     */
    public static boolean isValidEmail(String email) {
        boolean result = false;
        Pattern pt = Pattern.compile(sFormatEmail);
        Matcher mt = pt.matcher(email);
        if (mt.matches()) {
            result = true;
        }
        return result;
    }

    public static Date convertStringToDate(String str, String pattern) {
        String dateString = str;
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern, Locale.US);
        Date convertedDate = new Date();
        try {
            convertedDate = dateFormat.parse(dateString);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return convertedDate;
    }

    public static Date convertStringToDate(String str, String pattern, Locale locale) {
        String dateString = str;
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern, locale);
        Date convertedDate = new Date();
        try {
            convertedDate = dateFormat.parse(dateString);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return convertedDate;
    }

    public static String convertDateToString(Date date, String format) {
        if (date == null || format == null) {
            return "";
        }
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format, Locale.US);
            return dateFormat.format(date);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

    public static String convertDateToString(Date date, String format, Locale locale) {
        if (date == null || format == null) {
            return "";
        }
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format, locale);
            return dateFormat.format(date);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

    public static String saveBitmapToFileInFolder(Bitmap bitmap, String fileName,
                                                  String folderName) {
        String path = Environment.getExternalStorageDirectory() + "/LinkCare/" + folderName + "/";
        File file = new File(Environment.getExternalStorageDirectory(), "LinkCare");
        if (!file.exists()) {
            if (!file.mkdirs()) {
                Log.e("TravellerLog :: ", "Problem creating Image folder");
            }
        }
        file = new File(file, folderName);
        if (!file.exists()) {
            if (!file.mkdirs()) {
                Log.e("TravellerLog :: ", "Problem creating Image folder");
            }
        }
        path += fileName + ".PNG";
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(path);
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, out); // bmp is your Bitmap instance
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return path;
    }

    @SuppressWarnings("deprecation")
    public static int getWidthScreen(Context context) {
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        return metrics.widthPixels;
    }

    @SuppressWarnings("deprecation")
    public static int getHeightScreen(Context context) {
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        return metrics.heightPixels;
    }

    public static void setListViewHeightBasedOnChildren(ListView listView) {
        ListAdapter listAdapter = listView.getAdapter();
        if (listAdapter == null) {
            // pre-condition
            return;
        }

        int totalHeight = listView.getPaddingTop() + listView.getPaddingBottom();
        for (int i = 0; i < listAdapter.getCount(); i++) {
            View listItem = listAdapter.getView(i, null, listView);
            if (listItem instanceof ViewGroup) {
                listItem.setLayoutParams(
                        new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            listItem.measure(0, 0);
            totalHeight += listItem.getMeasuredHeight();
        }

        ViewGroup.LayoutParams params = listView.getLayoutParams();
        params.height = totalHeight + (listView.getDividerHeight() * (listAdapter.getCount() - 1));
        listView.setLayoutParams(params);
    }

<#if includeRetrofit>
    @JsonCreator
    public static <T> T autoParse(Response<String> response, TypeReference<T> typeRef) {
        T o = null;

        o = autoParse(response.body(), typeRef);
        if (o == null) {
            try {
                if (response.errorBody() != null) {
                    o = autoParse(response.errorBody().string(), typeRef);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return (T) o;
    }
</#if>

    @JsonCreator
    public static <T> T autoParse(Object response, TypeReference<T> typeRef) {
        JsonFactory factory = new JsonFactory();
        ObjectMapper mapper = new ObjectMapper(factory);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        T o = null;
        try {
            o = mapper.convertValue(response, typeRef);
        } catch (Exception e) {
            try {
                Log.v("Fail", e.getMessage());
                o = mapper.readValue(response.toString(), typeRef);
            } catch (Exception e1) {
                Log.v("Fail", e1.getMessage());
            }
        }
        return (T) o;
    }

    public static String parseObjectToJson(Object object) {
        JsonFactory JSON_FACTORY = new JsonFactory();
        final ObjectMapper OBJECT_MAPPER = new ObjectMapper(JSON_FACTORY);
//        OBJECT_MAPPER.configure(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL, false);

        try {
            return OBJECT_MAPPER.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public static float px2dp(float px, Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        float dp = px / (metrics.densityDpi / 160f);
        return dp;
    }

    public static float dp2px(float dp, Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        float px = dp * (metrics.densityDpi / 160f);
        return px;
    }

    public static void hideSoftKeyboard(Context context, EditText editText) {
        InputMethodManager inputManager = (InputMethodManager) context
                .getSystemService(Context.INPUT_METHOD_SERVICE);

        // check if no view has focus:
        inputManager.hideSoftInputFromWindow(editText.getWindowToken(), 0);
        editText.clearFocus();
    }

    public static void hideSoftKeyboard(Activity activity) {
        if (activity.getCurrentFocus() != null && activity.getCurrentFocus().getWindowToken() != null) {
            InputMethodManager inputMethodManager =
                    (InputMethodManager) activity.getSystemService(
                            Activity.INPUT_METHOD_SERVICE);
            inputMethodManager.hideSoftInputFromWindow(
                    activity.getCurrentFocus().getWindowToken(), 0);
        }
    }

    public static boolean isGoogleMapsInstalled(Context context) {
        try {
            context.getPackageManager().getApplicationInfo("com.google.android.apps.maps", 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    @NonNull
    public static String getString(int resId) {
        return ${classApplication}.getInstance().getString(resId);

    }

    public static List<String> getListString(@NonNull int resId) {
        List<String> lstString = new ArrayList<>();
        String[] arrStr = ${classApplication}.getInstance().getResources().getStringArray(resId);
        lstString = new ArrayList<String>(Arrays.asList(arrStr));
        return lstString;
    }

    public static int getColor(int resId) {
        if (${classApplication}.getInstance() != null) {
            return ${classApplication}.getInstance().getResources().getColor(resId);
        }
        return resId;
    }

    public static Drawable getDrawable(@NonNull int resId) {
        return ${classApplication}.getInstance().getResources().getDrawable(resId);
    }

    public static void loadImage(ImageView view, int resId) {
        view.setImageResource(resId);
    }

    private static void initPicasso() {
        Downloader downloader   = new OkHttpDownloader(${classApplication}.getInstance(), Integer.MAX_VALUE);
        picasso = new Picasso.Builder(${classApplication}.getInstance())
                .executor(Executors.newSingleThreadExecutor())
                .downloader(downloader)
                .memoryCache(new LruCache(Integer.MAX_VALUE))
                .build();
    }

    public static void loadImage(ImageView view, String string, int width, int height) {
        if (picasso == null) {
            initPicasso();
        }
        picasso.load(string)
                .resize(width, height)
                //.placeholder(R.drawable.img_loading)
                .into(view);
    }

    private static Hashtable<String, Typeface> fontCache = new Hashtable<String, Typeface>();

    public static Typeface get(String name, Context context) {
        Typeface tf = fontCache.get(name);
        if (tf == null) {
            try {
                tf = Typeface.createFromAsset(context.getAssets(), "fonts/" + name);
            } catch (RuntimeException e1) {
                tf = Typeface.DEFAULT;
            } catch (Exception e) {
                tf = Typeface.DEFAULT;
            }
            fontCache.put(name, tf);
        }
        return tf;
    }
}
