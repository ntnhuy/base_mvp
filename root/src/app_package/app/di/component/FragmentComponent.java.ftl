package ${packageName}.app.di.component;

import ${packageName}.app.bases.BaseFragment;
import ${packageName}.app.di.scopes.UserScope;
import ${packageName}.ui.fragments.home.HomeFragment;

import dagger.Component;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@UserScope
@Component(dependencies = AppComponent.class)
public interface FragmentComponent {
    void inject(BaseFragment fragment);
    void inject(HomeFragment fragment);
}
