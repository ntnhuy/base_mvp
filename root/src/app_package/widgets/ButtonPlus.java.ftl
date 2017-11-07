package ${packageName}.widgets;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;

import ${packageName}.R;
import ${packageName}.utils.Utils;

import java.lang.reflect.Field;

/**
 * Created by ntnhuy on 1/19/16
 */
public class ButtonPlus extends Button {

    private float duration = 250;

    private float speed = 1;
    private float radius = 0;
    private Paint paint = new Paint();
    private float endRadius = 0;
    private float rippleX = 0;
    private float rippleY = 0;
    private int width = 0;
    private int height = 0;
    private Handler handler;
    private int touchAction;
    private ButtonPlus buttonPlus = this;

    public ButtonPlus(Context context) {
        super(context);
        init(context, null);
    }

    public ButtonPlus(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public ButtonPlus(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    private void init(Context ctx, AttributeSet attrs) {
        String font = null;
        if (attrs != null) {
            TypedArray typedArray = ctx.obtainStyledAttributes(attrs, R.styleable.TextViewPlus);
            font = typedArray.getString(R.styleable.TextViewPlus_font);
            typedArray.recycle();
        }
        if (TextUtils.isEmpty(font)) {
            font = ctx.getString(R.string.font_montserrat_light);
        }

        setFont(ctx, font);

        if (isInEditMode())
            return;

        handler = new Handler(Looper.getMainLooper());
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(Color.WHITE);
        paint.setAntiAlias(true);
    }

    public void setFont(Context ctx, String font) {
        try {
            setTypeface(Utils.get(font, ctx));
        } catch (Exception ex) {
            Log.v(TextViewPlus.class.getName(), ex.toString());
        }
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh)
    {
        super.onSizeChanged(w, h, oldw, oldh);
        width = w;
        height = h;
    }

    @Override
    protected void onDraw(@NonNull Canvas canvas)
    {
        super.onDraw(canvas);

        if(radius > 0 && radius < endRadius)
        {
            canvas.drawCircle(rippleX, rippleY, radius, paint);
            invalidate();

        }
    }

    @Override
    public boolean onTouchEvent(@NonNull MotionEvent event) {
        if (isEnabled()) {
            rippleX = event.getX();
            rippleY = event.getY();

            switch (event.getAction()) {
                case MotionEvent.ACTION_UP:
                    getParent().requestDisallowInterceptTouchEvent(false);
                    if (touchAction != MotionEvent.ACTION_CANCEL) {
                        touchAction = MotionEvent.ACTION_UP;

                        new AsyncTask<Void, OnClickListener, OnClickListener>() {
                            @Override
                            protected View.OnClickListener doInBackground(Void... params) {
                                View.OnClickListener onClickListener = null;
                                try {
                                    Field listenerInfoField = Class.forName("android.view.View").getDeclaredField("mListenerInfo");
                                    if (listenerInfoField != null) {
                                        listenerInfoField.setAccessible(true);
                                    }
                                    Object myLiObject = listenerInfoField.get(ButtonPlus.this);

                                    // get the field mOnClickListener, that holds the listener and cast it to a listener
                                    Field listenerField = Class.forName("android.view.View$ListenerInfo").getDeclaredField("mOnClickListener");
                                    if (listenerField != null && myLiObject != null) {
                                        onClickListener = (View.OnClickListener) listenerField.get(myLiObject);
                                    }
                                } catch (NoSuchFieldException e) {
                                    e.printStackTrace();
                                } catch (IllegalAccessException e) {
                                    e.printStackTrace();
                                } catch (ClassNotFoundException e) {
                                    e.printStackTrace();
                                }
                                return onClickListener;
                            }

                            @Override
                            protected void onPostExecute(final OnClickListener onClickListener) {
                                super.onPostExecute(onClickListener);
                                if (onClickListener != null) {
                                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                                        @Override
                                        public void run() {
                                            onClickListener.onClick(ButtonPlus.this);
                                        }
                                    });
                                }
                            }
                        }.execute();

                    }
//
//                radius = 0;
//                invalidate();
                    break;

                case MotionEvent.ACTION_DOWN:
                    getParent().requestDisallowInterceptTouchEvent(true);
                    touchAction = MotionEvent.ACTION_DOWN;
                    endRadius = Math.max(Math.max(Math.max(width - rippleX, rippleX), rippleY), height - rippleY);
                    paint.setAlpha(90);
                    radius = 1;
                    speed = endRadius / duration * 10;
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            if (radius < endRadius) {
                                radius += speed;
                                paint.setAlpha(90 - (int) (radius / endRadius * 90));
                                handler.postDelayed(this, 1);
                            }
                        }
                    }, 10);
                    invalidate();
                    return true;

                case MotionEvent.ACTION_CANCEL:
                    getParent().requestDisallowInterceptTouchEvent(false);
                    touchAction = MotionEvent.ACTION_CANCEL;
//                radius = 0;
//                invalidate();
                    break;

                case MotionEvent.ACTION_MOVE:
                    if (rippleX < 0 || rippleX > width || rippleY < 0 || rippleY > height) {
                        getParent().requestDisallowInterceptTouchEvent(false);
                        touchAction = MotionEvent.ACTION_CANCEL;
                        break;
                    } else {
                        touchAction = MotionEvent.ACTION_MOVE;
//                    invalidate();
//                    return true;
                    }
            }
        }

        return true;
    }
}
