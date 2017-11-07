package ${packageName}.app.bases;

/**
 * Created by ntnhuy on 2/23/16.
 */
public interface Presenter<V extends MvpView> {
    void attachView(V mvpView);

    void detachView();
}
