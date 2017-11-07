package ${packageName}.app.di.component;

import ${packageName}.ui.activities.main.${activityClass};
import ${packageName}.app.bases.BaseActivity;
import ${packageName}.app.di.scopes.UserScope;
import ${packageName}.ui.activities.splash.SplashActivity;

import dagger.Component;

/**
 * Created by tohuy on 9/8/17.
 */

@UserScope
@Component(dependencies = AppComponent.class)
public interface ActivityComponent {
    void inject(BaseActivity activity);
    void inject(SplashActivity activity);
    void inject(${activityClass} activity);
}
