package ${packageName}.app.di.component;

import ${packageName}.app.di.scopes.UserScope;
import ${packageName}.widgets.iconWithNotification.IconWithNotification;
import ${packageName}.widgets.recyclerViewPlus.RecyclerViewPlus;

import dagger.Component;

/**
 * Created by tohuy on 9/17/17.
 */

@UserScope
@Component(dependencies = AppComponent.class)
public interface ViewComponent {
    void inject(IconWithNotification iconWithNotification);
    void inject(RecyclerViewPlus recyclerViewPlus);
}
