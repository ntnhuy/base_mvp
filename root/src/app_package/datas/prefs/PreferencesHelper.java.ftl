package ${packageName}.datas.prefs;

/**
 * Created by tohuy on 9/22/17.
 */

public interface PreferencesHelper {
    void clearPrefs();
    void setIsFirstInstallApp(boolean isFirstInstallApp);
    boolean isFirstInstallApp();
    void setIsLogin(boolean isLogin);
    boolean isLogin();
}
