package ${packageName}.analyticss.ga;

import android.content.Context;

import ${packageName}.app.di.ApplicationContext;
import ${packageName}.app.di.TrackerInfo;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.HitBuilders;
import com.google.android.gms.analytics.Tracker;

import org.json.JSONException;
import org.json.JSONObject;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */

@Singleton
public class AppGAHelper implements GAHelper {

    private final Tracker mTracker;

    @Inject
    public AppGAHelper(@ApplicationContext Context context, @TrackerInfo String key) {
        mTracker = GoogleAnalytics.getInstance(context).newTracker(key);;
    }

    @Override
    public void trackScreen(String screen) {
        mTracker.setScreenName("Android." + screen);
        mTracker.send(new HitBuilders.ScreenViewBuilder().build());
    }
}
