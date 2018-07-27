package ${packageName}.analyticss.crashlytics;

import com.crashlytics.android.Crashlytics;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */

public interface CrashlyticsHelper {
    Crashlytics getCrashlytics();
}
