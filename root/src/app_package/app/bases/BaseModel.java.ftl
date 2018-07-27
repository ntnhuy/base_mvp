package ${packageName}.app.bases;

import android.databinding.BaseObservable;
import ${packageName}.utils.Utils;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class BaseModel extends BaseObservable {

    public String toString() {
        return Utils.parseObjectToJson(this);
    }
}
