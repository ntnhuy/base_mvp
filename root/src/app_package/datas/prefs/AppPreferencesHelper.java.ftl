package ${packageName}.datas.prefs;

import android.content.Context;
import android.content.SharedPreferences;

import ${packageName}.app.di.ApplicationContext;
import ${packageName}.app.di.PreferenceInfo;
import ${packageName}.utils.Constants;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@Singleton
public class AppPreferencesHelper implements PreferencesHelper {

    private final SharedPreferences mPrefs;

    @Inject
    public AppPreferencesHelper(@ApplicationContext Context context,
                                @PreferenceInfo String prefFileName) {
        mPrefs = context.getSharedPreferences(prefFileName, Context.MODE_PRIVATE);
    }


    @Override
    public void clearPrefs() {
        mPrefs.edit().clear();
    }

    @Override
    public void setIsFirstInstallApp(boolean isFirstInstallApp) {
        mPrefs.edit().putBoolean(Constants.SPK.IS_FIRST_INSTALL_APP, isFirstInstallApp).apply();
    }

    @Override
    public boolean isFirstInstallApp() {
        return mPrefs.getBoolean(Constants.SPK.IS_FIRST_INSTALL_APP, true);
    }

    @Override
    public void setIsLogin(boolean isLogin) {
        mPrefs.edit().putBoolean(Constants.SPK.IS_LOGIN, isLogin).apply();
    }

    @Override
    public boolean isLogin() {
        return mPrefs.getBoolean(Constants.SPK.IS_LOGIN, false);
    }
}
