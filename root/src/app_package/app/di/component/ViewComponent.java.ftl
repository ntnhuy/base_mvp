package ${packageName}.app.di.component;

import ${packageName}.app.di.scopes.UserScope;
import ${packageName}.widgets.iconWithNotification.IconWithNotification;
import ${packageName}.widgets.recyclerViewPlus.RecyclerViewPlus;

import dagger.Component;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
@UserScope
@Component(dependencies = AppComponent.class)
public interface ViewComponent {
    void inject(IconWithNotification iconWithNotification);
    void inject(RecyclerViewPlus recyclerViewPlus);
}
