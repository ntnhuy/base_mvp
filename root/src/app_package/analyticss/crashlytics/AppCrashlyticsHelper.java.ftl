package ${packageName}.analyticss.crashlytics;

import android.content.Context;

import ${packageName}.app.di.ApplicationContext;
import com.crashlytics.android.Crashlytics;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * Created by tohuy on 9/23/17.
 */

@Singleton
public class AppCrashlyticsHelper implements CrashlyticsHelper {

    private final Crashlytics mCrashlytics;

    @Inject
    public AppCrashlyticsHelper(Crashlytics crashlytics) {
        mCrashlytics = crashlytics;
    }

    @Override
    public Crashlytics getCrashlytics() {
        return mCrashlytics;
    }
}
