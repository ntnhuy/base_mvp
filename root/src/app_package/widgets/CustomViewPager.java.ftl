package ${packageName}.widgets;

import android.content.Context;
import android.databinding.BindingAdapter;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class CustomViewPager extends ViewPager {
    private boolean isSwipingEnabled = true;

    public CustomViewPager(Context context) {
        super(context);
    }

    public CustomViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @BindingAdapter("swipeEnable")
    public static void setSwipeEnable(CustomViewPager viewPager, boolean isSwipingEnabled) {
        viewPager.setSwipeEnable(isSwipingEnabled);
    }

    // Call this method in your motion events when you want to disable or enable
    // It should work as desired.
    public void setSwipeEnable(boolean isSwipingEnabled) {
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
