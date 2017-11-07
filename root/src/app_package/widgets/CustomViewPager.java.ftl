package ${packageName}.widgets;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;

/**
 * Created by ntnhuy on 28/06/2016.
 */
public class CustomViewPager extends ViewPager {
    private boolean isSwipingEnabled = true;

    public CustomViewPager(Context context) {
        super(context);
    }

    public CustomViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    // Call this method in your motion events when you want to disable or enable
    // It should work as desired.
    public void setSwipEnable(boolean isSwipingEnabled) {
        this.isSwipingEnabled = isSwipingEnabled;
    }

    @Override
    public boolean onInterceptTouchEvent(MotionEvent arg0) {
        return (this.isSwipingEnabled) ? super.onInterceptTouchEvent(arg0) : false;
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        return (this.isSwipingEnabled) ? super.onTouchEvent(event) : false;
    }
}
