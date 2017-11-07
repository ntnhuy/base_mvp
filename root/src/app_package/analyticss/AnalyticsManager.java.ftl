package ${packageName}.analyticss;
<#if includeFabric>
import ${packageName}.analyticss.crashlytics.CrashlyticsHelper;
</#if>
<#if includeGA>
import ${packageName}.analyticss.ga.GAHelper;
</#if>

/**
 * Created by tohuy on 9/23/17.
 */

public interface AnalyticsManager extends <#if includeGA>GAHelper</#if><#if includeGA && includeFabric>,</#if> <#if includeFabric>CrashlyticsHelper</#if> {
}
