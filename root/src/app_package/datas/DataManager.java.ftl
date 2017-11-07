package ${packageName}.datas;

<#if includeRetrofit || includeDB>
import io.reactivex.Observable;
<#if includeRetrofit>
import ${packageName}.datas.api.ApiHelper;
</#if>
<#if includeDB>
import ${packageName}.datas.db.DbHelper;
</#if>
</#if>
import ${packageName}.datas.prefs.PreferencesHelper;

/**
 * Created by ntnhuy on 20/03/2016.
 */
public interface DataManager extends PreferencesHelper<#if includeDB>, DbHelper</#if><#if includeRetrofit>, ApiHelper</#if> {
<#if includeDB>
    Observable<Boolean> logout();
<#else>
	void logout();
</#if>
}
