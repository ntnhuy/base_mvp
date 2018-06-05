package ${packageName}.app.di.component;

import ${packageName}.app.bases.BaseFragment;
import ${packageName}.app.di.scopes.UserScope;
import ${packageName}.ui.fragments.home.HomeFragment;

import dagger.Component;

/**
 * Created by tohuy on 9/17/17.
 */

@UserScope
@Component(dependencies = AppComponent.class)
public interface FragmentComponent {
    void inject(BaseFragment fragment);
    void inject(HomeFragment fragment);
}
