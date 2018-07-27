package ${packageName}.widgets;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Handler;
import android.support.v7.widget.Toolbar;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import ${packageName}.R;
import ${packageName}.listeners.OnBackListener;
import ${packageName}.listeners.OnClickLeftMenuListener;
import ${packageName}.listeners.OnClickRightMenuListener;
import ${packageName}.listeners.OnCloseListener;
import ${packageName}.utils.Utils;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public class ToolBarPlus extends Toolbar {

    Context ctx;
    private ImageView imgBack;
    private ImageView imgClose;
    private TextViewPlus tvTitle;
    private TextViewPlus tvRightMenu;
    private TextViewPlus tvLeftMenu;
    
    private String fontTitle;
    private String fontMenu;
    private boolean isShowClose;
    private boolean isShowBack;
    private String textTitle;
    private int textColorTitle;
    private String textRightMenu;
    private String textLeftMenu;
    private int textColorRightMenu;
    private int textColorLeftMenu;

    private OnBackListener onBackListener;
    private OnCloseListener onCloseListener;
    private OnClickRightMenuListener onClickRightMenuListener;
    private OnClickLeftMenuListener onClickLeftMenuListener;

    public ToolBarPlus(Context context) {
        super(context);
        ctx = context;
        addView();
        setAttributes(null);
    }

    public ToolBarPlus(Context context, AttributeSet attrs) {
        super(context, attrs);
        ctx = context;
        addView();
        setAttributes(attrs);
    }

    public ToolBarPlus(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        ctx = context;
        addView();
        setAttributes(attrs);
    }

    private void setAttributes(AttributeSet attrs) {
        if (attrs != null) {
            TypedArray typedArray = ctx.obtainStyledAttributes(attrs, R.styleable.ToolBarPlus);
            setFontTitle(typedArray.getString(R.styleable.ToolBarPlus_fontTitle));
            setFontMenu(typedArray.getString(R.styleable.ToolBarPlus_fontMenu));
            setShowBack(typedArray.getBoolean(R.styleable.ToolBarPlus_showBack, false));
            setShowClose(typedArray.getBoolean(R.styleable.ToolBarPlus_showClose, false));
            setTextTitle(typedArray.getString(R.styleable.ToolBarPlus_textTitle));
            setTextRightMenu(typedArray.getString(R.styleable.ToolBarPlus_textMenu));
            setTextColorTitle(typedArray.getColor(R.styleable.ToolBarPlus_textColorTitle, Color.WHITE));
            setTextColorRightMenu(typedArray.getColor(R.styleable.ToolBarPlus_textColorRightMenu, Utils.getColor(R.color.white)));
            setTextColorLeftMenu(typedArray.getColor(R.styleable.ToolBarPlus_textColorLeftMenu, Utils.getColor(R.color.white)));
            typedArray.recycle();
        } else {
            setFontTitle(ctx.getString(R.string.font_montserrat_regular));
            setFontMenu(ctx.getString(R.string.font_montserrat_regular));
            setShowBack(false);
            setShowClose(false);
            setTextTitle("");
            setTextRightMenu("");
            setTextColorTitle(Color.WHITE);
            setTextColorRightMenu(Utils.getColor(R.color.white));
            setTextColorLeftMenu(Utils.getColor(R.color.white));
        }
    }

    private void addView() {
        setContentInsetsAbsolute(0, 0);
        setBackgroundColor(Utils.getColor(R.color.colorPrimaryDark));
        LinearLayout llt = new LinearLayout(ctx);
        llt.setOrientation(LinearLayout.VERTICAL);
        addView(llt, new LayoutParams(-2, (int) Utils.dp2px(52, ctx)));
        RelativeLayout rlt = new RelativeLayout(ctx);
        llt.addView(rlt, new LayoutParams(-2, (int) Utils.dp2px(50, ctx)));

        LinearLayout lltLeft = new LinearLayout(ctx);
        lltLeft.setId(R.id.llt_left);
        lltLeft.setOrientation(LinearLayout.HORIZONTAL);
        RelativeLayout.LayoutParams paramsLltLeft = new RelativeLayout.LayoutParams(-2, -2);
        paramsLltLeft.leftMargin = (int) Utils.dp2px(15, ctx);
        paramsLltLeft.addRule(RelativeLayout.CENTER_VERTICAL);
        rlt.addView(lltLeft, paramsLltLeft);

        int widthIcon = (int) Utils.dp2px(20, ctx);

        imgBack = new ImageView(ctx);
        LayoutParams paramsIcon = new LayoutParams(widthIcon, widthIcon);

        Utils.loadImage(imgBack, R.drawable.ic_back_white);
        imgBack.setVisibility(GONE);
        lltLeft.addView(imgBack, paramsIcon);

        imgClose = new ImageView(ctx);
        Utils.loadImage(imgClose, R.drawable.ic_close_white);
        imgClose.setVisibility(GONE);
        lltLeft.addView(imgClose, paramsIcon);

        LayoutParams paramsTvLeftMenu = new LayoutParams(-2, -2);
        tvLeftMenu = new TextViewPlus(ctx);
        tvLeftMenu.setAllCaps(true);
        tvLeftMenu.setTextAppearance(ctx, android.R.style.TextAppearance_Small);
        lltLeft.addView(tvLeftMenu, paramsTvLeftMenu);

        LinearLayout lltRight = new LinearLayout(ctx);
        lltRight.setOrientation(LinearLayout.HORIZONTAL);
        RelativeLayout.LayoutParams paramsLltRight = new RelativeLayout.LayoutParams(-2, -2);
        paramsLltRight.addRule(RelativeLayout.ALIGN_PARENT_RIGHT);
        paramsLltRight.addRule(RelativeLayout.CENTER_VERTICAL);
        lltRight.setPadding(0, 0, (int) Utils.dp2px(15, ctx), 0);
        rlt.addView(lltRight, paramsLltRight);

        LayoutParams paramsTvRightMenu = new LayoutParams(-2, -2);
        tvRightMenu = new TextViewPlus(ctx);
        tvRightMenu.setAllCaps(true);
        tvRightMenu.setTextAppearance(ctx, android.R.style.TextAppearance_Small);
        lltRight.addView(tvRightMenu, paramsTvRightMenu);

        RelativeLayout.LayoutParams paramsTvTitle = new RelativeLayout.LayoutParams(-2, -2);
        paramsTvTitle.addRule(RelativeLayout.CENTER_IN_PARENT);
        /*paramsTvTitle.addRule(RelativeLayout.RIGHT_OF, iconBadge.getId());
        paramsTvTitle.addRule(RelativeLayout.LEFT_OF, lltRight.getId());*/
        paramsTvTitle.leftMargin = 15;
        paramsTvTitle.rightMargin = 15;
        tvTitle = new TextViewPlus(ctx);
        tvTitle.setAllCaps(true);
        tvTitle.setGravity(Gravity.CENTER);
//        tvTitle.setSingleLine(true);
        tvTitle.setTextAppearance(ctx, android.R.style.TextAppearance_Small);
        rlt.addView(tvTitle, paramsTvTitle);


        View view = new View(ctx);
        view.setBackgroundResource(R.drawable.shadow_bottom);
//        llt.addView(view, new LayoutParams(-1, (int) Utils.dp2px(2, ctx)));


        initEvent();
    }

    private void initEvent() {
        imgBack.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if (onBackListener != null) {
                    effectClick(imgBack);
                    onBackListener.onBack();
                }
            }
        });

        imgClose.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if (onCloseListener != null) {
                    effectClick(imgClose);
                    onCloseListener.onClose();
                }
            }
        });

        tvLeftMenu.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if (onClickLeftMenuListener != null) {
                    effectClick(tvLeftMenu);
                    onClickLeftMenuListener.onClick();
                }
            }
        });

        tvRightMenu.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                if (onClickRightMenuListener != null) {
                    effectClick(tvRightMenu);
                    onClickRightMenuListener.onClick();
                }
            }
        });
    }

    private void effectClick(final View view) {
        if (view != null) {
            view.setEnabled(false);
            view.setAlpha(0.5f);
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (view != null) {
                        view.setEnabled(true);
                        view.setAlpha(1f);
                    }
                }
            }, 500);
        }
    }

    public void reset() {
        this.setVisibility(VISIBLE);
        setShowBack(false);
        setShowClose(false);
        setTextRightMenu("");
        setTextLeftMenu("");
    }

    public String getFontTitle() {
        return fontTitle;
    }

    public void setFontTitle(String fontTitle) {
        this.fontTitle = fontTitle;
        if (TextUtils.isEmpty(fontTitle)) {
            this.fontTitle = ctx.getString(R.string.font_montserrat_regular);
        }
        if (tvTitle != null) {
            try {
                tvTitle.setTypeface(Utils.get(fontTitle, ctx));
            } catch (Exception ex) {
                Log.v(TextViewPlus.class.getName(), ex.toString());
            }
        }
    }

    public String getFontMenu() {
        return fontMenu;
    }

    public void setFontMenu(String fontMenu) {
        this.fontMenu = fontMenu;
        if (TextUtils.isEmpty(fontMenu)) {
            this.fontMenu = ctx.getString(R.string.font_montserrat_regular);
        }
        if (tvRightMenu != null) {
            try {
                tvRightMenu.setTypeface(Utils.get(fontMenu, ctx));
            } catch (Exception ex) {
                Log.v(TextViewPlus.class.getName(), ex.toString());
            }
        }
        if (tvLeftMenu != null) {
            try {
                tvLeftMenu.setTypeface(Utils.get(fontMenu, ctx));
            } catch (Exception ex) {
                Log.v(TextViewPlus.class.getName(), ex.toString());
            }
        }
    }

    public boolean isShowClose() {
        return isShowClose;
    }

    public void setShowClose(boolean showClose) {
        isShowClose = showClose;
        if (imgClose != null) {
            imgClose.setVisibility(isShowClose ? VISIBLE : GONE);
            if (!isShowClose) {
//                onCloseListener = null;
            }
        }
    }

    public boolean isShowBack() {
        return isShowBack;
    }

    public void setShowBack(boolean showBack) {
        isShowBack = showBack;
        if (imgBack != null) {
            imgBack.setVisibility(isShowBack ? VISIBLE : GONE);
            if (!isShowBack) {
//                onBackListener = null;
            }
        }
    }

    public String getTextTitle() {
        return textTitle;
    }

    public void setTextTitle(String textTitle) {
        this.textTitle = textTitle;
        if (tvTitle != null) {
            tvTitle.setText(textTitle);
        }
    }

    public int getTextColorTitle() {
        return textColorTitle;
    }

    public void setTextColorTitle(int textColorTitle) {
        this.textColorTitle = textColorTitle;// == -1 ? Utils.getColor(R.color.a200_orange) : textColorTitle;
        if (tvTitle != null) {
            tvTitle.setTextColor(this.textColorTitle);
        }
    }

    public String getTextRightMenu() {
        return textRightMenu;
    }

    public void setTextRightMenu(String textMenu) {
        this.textRightMenu = textMenu;
        if (tvRightMenu != null) {
            tvRightMenu.setText(textMenu);
            if (TextUtils.isEmpty(textMenu)) {
                tvRightMenu.setVisibility(GONE);
            } else {
                tvRightMenu.setVisibility(VISIBLE);
            }
        }
    }

    public int getTextColorRightMenu() {
        return textColorRightMenu;
    }

    public void setTextColorRightMenu(int textColorRightMenu) {
        this.textColorRightMenu = textColorRightMenu;// == -1 ? Color.BLACK : textColorRightMenu;
        if (tvRightMenu != null) {
            tvRightMenu.setTextColor(this.textColorRightMenu);
        }
    }

    public OnBackListener getOnBackListener() {
        return onBackListener;
    }

    public void setOnBackListener(OnBackListener onBackListener) {
        this.onBackListener = onBackListener;
    }

    public OnCloseListener getOnCloseListener() {
        return onCloseListener;
    }

    public void setOnCloseListener(OnCloseListener onCloseListener) {
        this.onCloseListener = onCloseListener;
    }

    public OnClickRightMenuListener getOnClickRightMenuListener() {
        return onClickRightMenuListener;
    }

    public void setOnClickRightMenuListener(OnClickRightMenuListener onClickRightMenuListener) {
        this.onClickRightMenuListener = onClickRightMenuListener;
    }

    public OnClickLeftMenuListener getOnClickLeftMenuListener() {
        return onClickLeftMenuListener;
    }

    public void setOnClickLeftMenuListener(OnClickLeftMenuListener onClickLeftMenuListener) {
        this.onClickLeftMenuListener = onClickLeftMenuListener;
    }

    public String getTextLeftMenu() {
        return textLeftMenu;
    }

    public void setTextLeftMenu(String textLeftMenu) {
        this.textLeftMenu = textLeftMenu;
        if (tvLeftMenu != null) {
            tvLeftMenu.setText(textLeftMenu);
            if (TextUtils.isEmpty(textLeftMenu)) {
                tvLeftMenu.setVisibility(GONE);
            } else {
                tvLeftMenu.setVisibility(VISIBLE);
            }
        }
    }

    public int getTextColorLeftMenu() {
        return textColorLeftMenu;
    }

    public void setTextColorLeftMenu(int textColorLeftMenu) {
        this.textColorLeftMenu = textColorLeftMenu;// == -1 ? Color.BLACK : textColorLeftMenu;
        if (tvLeftMenu != null) {
            tvLeftMenu.setTextColor(this.textColorLeftMenu);
        }
    }
}
