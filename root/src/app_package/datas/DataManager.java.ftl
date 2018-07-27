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
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface DataManager extends PreferencesHelper<#if includeDB>, DbHelper</#if><#if includeRetrofit>, ApiHelper</#if> {
<#if includeDB>
    Observable<Boolean> logout();
<#else>
	void logout();
</#if>
}
