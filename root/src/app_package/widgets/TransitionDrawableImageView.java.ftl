package ${packageName}.widgets;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.CountDownTimer;
import android.util.AttributeSet;
import android.widget.ImageView;

import ${packageName}.R;

public class TransitionDrawableImageView extends ImageView {
    private CountDownTimer mCountDownTimer;
    private boolean mIsReversing = true;

    private int mDuration = 2000;

    public TransitionDrawableImageView(Context context) {
        super(context);

        init(context, null);
    }

    public TransitionDrawableImageView(Context context, AttributeSet attrs) {
        super(context, attrs);

        init(context, attrs);
    }

    public TransitionDrawableImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);

        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs){
        if(attrs != null) {
            TypedArray array = context.obtainStyledAttributes(attrs, R.styleable.TransitionDrawableImageView);
            mDuration = array.getInt(R.styleable.TransitionDrawableImageView_duration, mDuration);
            array.recycle();
        }

        mCountDownTimer = new CountDownTimer(mDuration, mDuration) {
            @Override
            public void onTick(long millisUntilFinished) {}

            @Override
            public void onFinish() {
                final Drawable drawable = getDrawable();
                if(drawable != null && drawable instanceof TransitionDrawable) {
                    if(mIsReversing) {
                        ((TransitionDrawable) drawable).startTransition(mDuration);
                        mIsReversing = false;
                    } else {
                        ((TransitionDrawable) drawable).reverseTransition(mDuration);
                        mIsReversing = true;
                    }

                    mCountDownTimer.start();
                }
            }
        };
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();

        final Drawable drawable = getDrawable();
        if(!isInEditMode() && drawable != null && drawable instanceof TransitionDrawable) {
            if(mIsReversing) {
                ((TransitionDrawable) drawable).startTransition(mDuration);
                mIsReversing = false;
            } else {
                ((TransitionDrawable) drawable).reverseTransition(mDuration);
                mIsReversing = true;
            }
            mCountDownTimer.start();
        }
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();

        mCountDownTimer.cancel();
        final Drawable drawable = getDrawable();
        if(!isInEditMode() && drawable != null && drawable instanceof TransitionDrawable) {
            ((TransitionDrawable) drawable).resetTransition();
            mIsReversing = true;
        }
    }
}
