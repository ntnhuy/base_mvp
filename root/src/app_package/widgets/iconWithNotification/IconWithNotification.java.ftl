package ${packageName}.widgets.iconWithNotification;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import ${packageName}.${classApplication};
import ${packageName}.R;
import ${packageName}.app.di.component.DaggerViewComponent;
import ${packageName}.app.di.component.ViewComponent;
import ${packageName}.widgets.TextViewPlus;

import javax.inject.Inject;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class IconWithNotification extends RelativeLayout implements IconWithNotificationView {
    
    private ImageView imgIcon;
    private TextViewPlus tvCount;

    Context ctx;

    private String font;
    private int widthIcon;
    private int heightIcon;
    private int widthText;
    private int heightText;
    private float ratio;
    private String text;
    private int textAppearance;
    private boolean textAllCaps;
    private Drawable src;
    private Drawable backgroundText;
    private float defaultTextSize;
    private int textColor;
    private int gravityTextView;
    private int paddingTextView;

    private ViewComponent viewComponent;

    @Inject
    public IconWithNotificationPresenter presenter;
    
    
    public IconWithNotification(Context context) {
        super(context);
        ctx = context;
        addView();
        presenter.setAttributes(null);
    }

    public IconWithNotification(Context context, AttributeSet attrs) {
        super(context, attrs);
        ctx = context;
        addView();
        presenter.setAttributes(attrs);
    }

    public IconWithNotification(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        ctx = context;
        addView();
        presenter.setAttributes(attrs);
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    public IconWithNotification(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        ctx = context;
        addView();
        presenter.setAttributes(attrs);
    }

    private void addView() {
        viewComponent = DaggerViewComponent.builder()
                .appComponent(${classApplication}.getInstance().getAppComponent())
                .build();
        viewComponent.inject(this);
        presenter.attachView(this);
        imgIcon = new ImageView(ctx);
        tvCount = new TextViewPlus(ctx);
        LayoutParams params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.addRule(ALIGN_PARENT_LEFT);
        addView(imgIcon, params);

        params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.addRule(ALIGN_PARENT_RIGHT);
        addView(tvCount, params);

        params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        setLayoutParams(params);
    }

    public ImageView getImgIcon() {
        return imgIcon;
    }

    public void setImgIcon(ImageView imgIcon) {
        this.imgIcon = imgIcon;
    }

    public TextViewPlus getTvCount() {
        return tvCount;
    }

    public void setTvCount(TextViewPlus tvCount) {
        this.tvCount = tvCount;
    }

    public String getFont() {
        return font;
    }

    public void setFont(String font) {
        this.font = font;
        if (TextUtils.isEmpty(font)) {
            this.font = ctx.getString(R.string.font_montserrat_light);
        }
        if (tvCount != null) {
            try {
                Typeface typeface = Typeface.createFromAsset(ctx.getAssets(), "fonts/" + this.font);
                tvCount.setTypeface(typeface);
            } catch (Exception ex) {
                Log.v(TextViewPlus.class.getName(), ex.toString());
            }
        }
    }

    public int getWidthIcon() {
        return widthIcon;
    }

    public void setWidthIcon(int widthIcon) {
        this.widthIcon = widthIcon;
        if (imgIcon != null) {
            LayoutParams params = (LayoutParams) imgIcon.getLayoutParams();
            if (params == null) {
                params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            params.width = widthIcon;
            imgIcon.setLayoutParams(params);
        }
    }

    public int getHeightIcon() {
        return heightIcon;
    }

    public void setHeightIcon(int heightIcon) {
        this.heightIcon = heightIcon;
        if (imgIcon != null) {
            LayoutParams params = (LayoutParams) imgIcon.getLayoutParams();
            if (params == null) {
                params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            params.height = heightIcon;
            imgIcon.setLayoutParams(params);
        }
    }

    public int getWidthText() {
        return widthText;
    }

    public void setWidthText(int widthText) {
        this.widthText = widthText;
        if (tvCount != null) {
            LayoutParams params = (LayoutParams) tvCount.getLayoutParams();
            if (params == null) {
                params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            params.width = widthText;
            tvCount.setLayoutParams(params);
        }
    }

    public int getHeightText() {
        return heightText;
    }

    public void setHeightText(int heightText) {
        this.heightText = heightText;
        if (tvCount != null) {
            LayoutParams params = (LayoutParams) tvCount.getLayoutParams();
            if (params == null) {
                params = new LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            }
            params.height = heightText;
            tvCount.setLayoutParams(params);
        }
    }

    public float getRatio() {
        return ratio;
    }

    public void setRatio(float ratio) {
        this.ratio = ratio;
        if (tvCount != null) {
            tvCount.setTextSize(TypedValue.COMPLEX_UNIT_PX, defaultTextSize * ratio);
        }
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
        if (tvCount != null) {
            tvCount.setText(text);
            if (this.text.trim().equals("0".trim())) {
                tvCount.setVisibility(GONE);
            } else {
                tvCount.setVisibility(VISIBLE);
            }
        }
    }

    public int getTextAppearance() {
        return textAppearance;
    }

    public void setTextAppearance(int textAppearance) {
        this.textAppearance = textAppearance;
        if (tvCount != null && textAppearance != -1) {
            tvCount.setTextAppearance(ctx, getTextAppearance());
            defaultTextSize = tvCount.getTextSize();
        }
    }

    public boolean isTextAllCaps() {
        return textAllCaps;
    }

    public void setTextAllCaps(boolean textAllCaps) {
        this.textAllCaps = textAllCaps;
        if (tvCount != null) {
            tvCount.setAllCaps(textAllCaps);
        }
    }

    public Drawable getSrc() {
        return src;
    }

    public void setSrc(Drawable src) {
        this.src = src;
        if (imgIcon != null) {
            imgIcon.setImageDrawable(src);
        }
    }

    public Drawable getBackgroundText() {
        return backgroundText;
    }

    public void setBackgroundText(Drawable backgroundText) {
        this.backgroundText = backgroundText;
        if (tvCount != null) {
            tvCount.setBackground(backgroundText);
        }
    }

    public float getDefaultTextSize() {
        return defaultTextSize;
    }

    public void setDefaultTextSize(float defaultTextSize) {
        this.defaultTextSize = defaultTextSize;
    }

    public int getTextColor() {
        return textColor;
    }

    public void setTextColor(int textColor) {
        this.textColor = textColor;
        if (tvCount != null) {
            tvCount.setTextColor(textColor);
        }
    }

    public int getGravityTextView() {
        return gravityTextView;
    }

    public void setGravityTextView(int gravityTextView) {
        this.gravityTextView = gravityTextView;
        if (tvCount != null) {
            tvCount.setGravity(gravityTextView);
        }
    }

    public int getPaddingTextView() {
        return paddingTextView;
    }

    public void setPaddingTextView(int paddingTextView) {
        this.paddingTextView = paddingTextView;
        if (tvCount != null) {
            tvCount.setPadding(paddingTextView, paddingTextView, paddingTextView, paddingTextView);
        }
    }

    @Override
    public void resetView() {

    }
}
