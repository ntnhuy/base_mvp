package ${packageName}.app.bases;

import ${packageName}.app.bases.MvpView;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface BaseActivityView extends MvpView {

    boolean hasTabBar();

    void registerNetworkStateReceiver();

    void unregisterNetworkStateReceiver();

    void ensureConnectionLossSnackBar();

    void addSnackBarTopMargin();

    void displayConnectionLoss();

    void dismissConnectionLoss();
}
