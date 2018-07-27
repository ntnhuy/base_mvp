package ${packageName}.datas.prefs;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface PreferencesHelper {
    void clearPrefs();
    void setIsFirstInstallApp(boolean isFirstInstallApp);
    boolean isFirstInstallApp();
    void setIsLogin(boolean isLogin);
    boolean isLogin();
}
