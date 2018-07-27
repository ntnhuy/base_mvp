package ${packageName}.analyticss;

import android.content.Context;

<#if includeFabric>
import ${packageName}.analyticss.crashlytics.CrashlyticsHelper;
import com.crashlytics.android.Crashlytics;
</#if>
<#if includeGA>
import ${packageName}.analyticss.ga.GAHelper;
</#if>
import ${packageName}.app.di.ApplicationContext;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@Singleton
public class AppAnalyticsManager implements AnalyticsManager {

    private final Context mContext;
    <#if includeGA>
    private final GAHelper mGAHelper;
    </#if>
    <#if includeFabric>
    private final CrashlyticsHelper mCrashlyticsHelper;
    </#if>

    @Inject
    public AppAnalyticsManager(@ApplicationContext Context context<#if includeGA>, GAHelper gaHelper</#if><#if includeFabric>, CrashlyticsHelper crashlyticsHelper</#if>) {
        mContext = context;
        <#if includeGA>
        mGAHelper = gaHelper;
        </#if>
        <#if includeFabric>
        mCrashlyticsHelper = crashlyticsHelper;
        </#if>
    }
<#if includeGA>
    @Override
    public void trackScreen(String screen) {
        mGAHelper.trackScreen(screen);
    }
</#if>
<#if includeFabric>
    @Override
    public Crashlytics getCrashlytics() {
        return mCrashlyticsHelper.getCrashlytics();
    }
</#if>
}
