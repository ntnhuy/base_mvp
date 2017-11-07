package ${packageName}.widgets;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Html;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.utils.Utils;

/**
 * Created by ntnhuy on 14/12/2015.
 */
public class TextViewPlus extends TextView {
    private float defaultTextSize;

    private int mDrawableWidth;
    private int mDrawableHeight;

    public TextViewPlus(Context context) {
        super(context);
        init(context, null);
    }

    public TextViewPlus(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public TextViewPlus(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    public TextViewPlus(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context, attrs);
    }

    private void init(Context ctx, AttributeSet attrs) {
        defaultTextSize = getTextSize();
        String font = null;
        String text = null;
        float ratio = 1;
        if (attrs != null) {
            TypedArray typedArray = ctx.obtainStyledAttributes(attrs, R.styleable.TextViewPlus);
            font = typedArray.getString(R.styleable.TextViewPlus_font);
            text = typedArray.getString(R.styleable.TextViewPlus_htmlString);
            setDrawableWidth(typedArray.getDimensionPixelSize(R.styleable.TextViewPlus_compoundDrawableWidth, -1));
            setDrawableHeight(typedArray.getDimensionPixelSize(R.styleable.TextViewPlus_compoundDrawableHeight, -1));
            ratio = typedArray.getFloat(R.styleable.TextViewPlus_ratio_text_size, 1);
            typedArray.recycle();
        }
        if (TextUtils.isEmpty(font)) {
            font = ctx.getString(R.string.font_montserrat_light);
        }

//        int rate = SharedPreferenceHelper.getInt(ctx, Constants.KEY_FONT_SIZE, 0);
//        if (rate != 0) {
//            setTextSize(((float) ((double) rate / 100) * getTextSize()) / 2);
//        }
        setTextSize(TypedValue.COMPLEX_UNIT_PX, defaultTextSize * ratio);
        setFont(ctx, font);
        setTextHtml(text);
        if (getDrawableWidth() > 0 || getDrawableHeight() > 0) {
            initCompoundDrawableSize();
        }
    }

    public void setFont(Context ctx, String font) {
        try {
            setTypeface(Utils.get(font, ctx));
        } catch (Exception ex) {
            Log.v(TextViewPlus.class.getName(), ex.toString());
        }
    }

    public void setDrawables(Drawable left, Drawable top, Drawable right, Drawable bottom) {
        setCompoundDrawablesWithIntrinsicBounds(left, top, right, bottom);
        initCompoundDrawableSize();
    }

    public void setDrawableLeft(Drawable left) {
        Drawable[] drawables = getCompoundDrawables();
        setCompoundDrawablesWithIntrinsicBounds(left, drawables[1], drawables[2], drawables[3]);
        initCompoundDrawableSize();
    }

    public void setDrawableTop(Drawable top) {
        Drawable[] drawables = getCompoundDrawables();
        setCompoundDrawablesWithIntrinsicBounds(drawables[0], top, drawables[2], drawables[3]);
        initCompoundDrawableSize();
    }

    public void setDrawableRight(Drawable right) {
        Drawable[] drawables = getCompoundDrawables();
        setCompoundDrawablesWithIntrinsicBounds(drawables[0], drawables[1], right, drawables[3]);
        initCompoundDrawableSize();
    }

    public void setDrawableBottom(Drawable bottom) {
        Drawable[] drawables = getCompoundDrawables();
        setCompoundDrawablesWithIntrinsicBounds(drawables[0], drawables[1], drawables[2], bottom);
        initCompoundDrawableSize();
    }

    private void initCompoundDrawableSize() {
        Drawable[] drawables = getCompoundDrawables();
        for (Drawable drawable : drawables) {
            if (drawable == null) {
                continue;
            }

            Rect realBounds = drawable.getBounds();
            float scaleFactor = realBounds.height() / (float) realBounds.width();

            float drawableWidth = realBounds.width();
            float drawableHeight = realBounds.height();

            if (getDrawableWidth() > 0) {
                // save scale factor of image
                if (drawableWidth > getDrawableWidth()) {
                    drawableWidth = getDrawableWidth();
                    drawableHeight = drawableWidth * scaleFactor;
                }
            }
            if (getDrawableHeight() > 0) {
                // save scale factor of image

                if (drawableHeight > getDrawableHeight()) {
                    drawableHeight = getDrawableHeight();
                    drawableWidth = drawableHeight / scaleFactor;
                }
            }

            realBounds.right = realBounds.left + Math.round(drawableWidth);
            realBounds.bottom = realBounds.top + Math.round(drawableHeight);

            drawable.setBounds(realBounds);
        }
        setCompoundDrawables(drawables[0], drawables[1], drawables[2], drawables[3]);
    }

    public float getDefaultTextSize() {
        return defaultTextSize;
    }

    public void setTextHtml(CharSequence text) {
        if (text != null) {
            setText(Html.fromHtml(text.toString()));
        }
    }

    public int getDrawableWidth() {
        return mDrawableWidth;
    }

    public void setDrawableWidth(int mDrawableWidth) {
        this.mDrawableWidth = mDrawableWidth;
    }

    public int getDrawableHeight() {
        return mDrawableHeight;
    }

    public void setDrawableHeight(int mDrawableHeight) {
        this.mDrawableHeight = mDrawableHeight;
    }
}
