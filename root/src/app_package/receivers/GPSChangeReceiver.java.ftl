package ${packageName}.receivers;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

import ${packageName}.utils.Utils;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class GPSChangeReceiver extends BroadcastReceiver {
    private OnGPSChangeListener mListener;
    private Integer mPreviousNetworkState;   //0: On    1: Off

    public GPSChangeReceiver() {}

    public void setListener(OnGPSChangeListener listener) {
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

        LocationManager manager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE );
        boolean statusOfGPS = manager.isProviderEnabled(LocationManager.GPS_PROVIDER);

        if (statusOfGPS) {
            if(mPreviousNetworkState == null || mPreviousNetworkState.equals(0)) {
                // Network state has changed
                mPreviousNetworkState = 0;
                if (mListener != null) {
                    mListener.onTurnOn();
                }
            }
        } else {
            mPreviousNetworkState = null;
            if (mListener != null){
                mListener.onTurnOff();
            }
        }
    }

    public interface OnGPSChangeListener {
        void onTurnOff();
        void onTurnOn();
    }
}

