package ${packageName}.receivers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class NetworkChangeReceiver extends BroadcastReceiver {
    private OnConnectivityChangeListener mListener;
    private Integer mPreviousNetworkState;

    public NetworkChangeReceiver() {}

    public void setListener(OnConnectivityChangeListener listener) {
        mListener = listener;
    }

    public void removeListener() {
        mListener = null;
    }

    @Override
    public void onReceive(Context context, final Intent intent) {
        delegate(context);
    }

    public void checkInitialState(Context context){
        delegate(context);
    }

    private void delegate(Context context){

        ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = cm.getActiveNetworkInfo();

        if (networkInfo != null){
            if (networkInfo.getType() == ConnectivityManager.TYPE_WIFI || networkInfo.getType() == ConnectivityManager.TYPE_MOBILE){
                if(mPreviousNetworkState == null || mPreviousNetworkState.equals(networkInfo.getType())) {
                    // Network state has changed
                    mPreviousNetworkState = networkInfo.getType();
                    if (mListener != null) {
                        mListener.onConnectivityResume();
                    }
                }
            }
        } else {
            mPreviousNetworkState = null;
            if (mListener != null){
                mListener.onConnectivityLoss();
            }
        }
    }

    public interface OnConnectivityChangeListener {
        void onConnectivityLoss();
        void onConnectivityResume();
    }
}