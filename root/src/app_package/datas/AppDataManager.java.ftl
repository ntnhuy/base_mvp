package ${packageName}.datas;

import android.content.Context;
<#if includeRetrofit || includeDB>
import io.reactivex.Observable;
<#if includeRetrofit>
import ${packageName}.datas.api.ApiHelper;
import retrofit2.Retrofit;
</#if>
<#if includeDB>
import ${packageName}.datas.db.DbHelper;
import ${packageName}.datas.models.User;
import java.util.List;
</#if>
</#if>
import ${packageName}.app.di.ApplicationContext;
import ${packageName}.datas.prefs.PreferencesHelper;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * Created by tohuy on 9/17/17.
 */

@Singleton
public class AppDataManager implements DataManager {

    private static final String TAG = "AppDataManager";

    private final Context mContext;
    <#if includeDB>
    private final DbHelper mDbHelper;
    </#if>
    <#if includeRetrofit>
    private final ApiHelper mApiHelper;
    </#if>
    private final PreferencesHelper mPreferencesHelper;

    @Inject
    public AppDataManager(@ApplicationContext Context context<#if includeDB>, DbHelper dbHelper</#if><#if includeRetrofit>, Retrofit retrofit</#if>, PreferencesHelper preferencesHelper) {
        mContext = context;
        <#if includeDB>
        mDbHelper = dbHelper;
        </#if>
        <#if includeRetrofit>
        mApiHelper = retrofit.create(ApiHelper.class);
        </#if>
        mPreferencesHelper = preferencesHelper;
    }

<#if includeDB>
    @Override
    public Observable<Boolean> clearDB() {
        return mDbHelper.clearDB();
    }

    @Override
    public Observable<Long> insertUser(User user) {
        return mDbHelper.insertUser(user);
    }

    @Override
    public Observable<Boolean> insertInTx(List<User> users) {
        return mDbHelper.insertInTx(users);
    }

    @Override
    public Observable<List<User>> getAllUsers() {
        return mDbHelper.getAllUsers();
    }

    @Override
    public Observable<List<User>> getUsers(String email, String password) {
        return mDbHelper.getUsers(email, password);
    }

    @Override
    public Observable<Boolean> logout() {
        clearPrefs();
        return clearDB();
    }
<#else>
    @Override
    public void logout() {
        clearPrefs();
    }
</#if>

    @Override
    public void clearPrefs() {
        mPreferencesHelper.clearPrefs();
    }

    @Override
    public void setIsFirstInstallApp(boolean isFirstInstallApp) {
        mPreferencesHelper.setIsFirstInstallApp(isFirstInstallApp);
    }

    @Override
    public boolean isFirstInstallApp() {
        return mPreferencesHelper.isFirstInstallApp();
    }

    @Override
    public void setIsLogin(boolean isLogin) {
        mPreferencesHelper.setIsLogin(isLogin);
    }

    @Override
    public boolean isLogin() {
        return mPreferencesHelper.isLogin();
    }
}
