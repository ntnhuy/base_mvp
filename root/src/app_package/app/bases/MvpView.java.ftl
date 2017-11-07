package ${packageName}.app.bases;

import android.content.Context;

/**
 * Created by ntnhuy on 2/23/16.
 */
public interface MvpView {
    Context getContext();
    void resetView();
}
