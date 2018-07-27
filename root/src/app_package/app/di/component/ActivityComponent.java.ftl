package ${packageName}.app.di.component;

import ${packageName}.ui.activities.main.${activityClass};
import ${packageName}.app.bases.BaseActivity;
import ${packageName}.app.di.scopes.UserScope;
import ${packageName}.ui.activities.splash.SplashActivity;

import dagger.Component;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@UserScope
@Component(dependencies = AppComponent.class)
public interface ActivityComponent {
    void inject(BaseActivity activity);
    void inject(SplashActivity activity);
    void inject(${activityClass} activity);
}
