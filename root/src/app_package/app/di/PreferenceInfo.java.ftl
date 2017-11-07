package ${packageName}.app.di;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

import javax.inject.Qualifier;

/**
 * Created by tohuy on 9/17/17.
 */

@Qualifier
@Retention(RetentionPolicy.RUNTIME)
public @interface PreferenceInfo {
}
