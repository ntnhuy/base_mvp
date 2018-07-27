package ${packageName}.analyticss;
<#if includeFabric>
import ${packageName}.analyticss.crashlytics.CrashlyticsHelper;
</#if>
<#if includeGA>
import ${packageName}.analyticss.ga.GAHelper;
</#if>

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface AnalyticsManager extends <#if includeGA>GAHelper</#if><#if includeGA && includeFabric>,</#if> <#if includeFabric>CrashlyticsHelper</#if> {
}
