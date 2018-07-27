package ${packageName}.app.bases;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface Presenter<V extends MvpView> {
    void attachView(V mvpView);

    void detachView();
}
