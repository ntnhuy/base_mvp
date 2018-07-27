package ${packageName}.app.bases;

import android.content.Context;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public interface MvpView {
    Context getContext();
    void resetView();
}
