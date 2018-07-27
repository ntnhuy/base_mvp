package ${packageName}.widgets.recyclerViewPlus;

import ${packageName}.app.bases.MvpView;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface RecyclerViewPlusView extends MvpView {
    boolean findRecyclerView();
    boolean findLoadingState();
    boolean findEmptyState();
    boolean findErrorState();

    void showContentState();
    void showContentStateAnimated();
    void hideContentState();
    void hideContentStateAnimated();

    void showLoadingState();
    void showLoadingStateAnimated();
    void hideLoadingState();
    void hideLoadingStateAnimated();

    void showEmptyState();
    void showEmptyStateAnimated();
    void hideEmptyState();
    void hideEmptyStateAnimated();

    void showErrorState();
    void showErrorStateAnimated();
    void hideErrorState();
    void hideErrorStateAnimated();
}
