package ${packageName}.widgets;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.support.design.widget.TextInputLayout;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import ${packageName}.R;
import ${packageName}.utils.Utils;

/**
 * Created by ntnhuy on 20/03/2016.
 */
public class TextInputLayoutPlus extends TextInputLayout {
    String error = "";

    public TextInputLayoutPlus(Context context) {
        super(context);
        init(context, null);
    }

    public TextInputLayoutPlus(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public TextInputLayoutPlus(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);

    }

    private void init(Context ctx, AttributeSet attrs) {
        String font = null;
        if (attrs != null) {
            TypedArray typedArray = ctx.obtainStyledAttributes(attrs, R.styleable.TextInputLayoutPlus);
            font = typedArray.getString(R.styleable.TextViewPlus_font);
            error = typedArray.getString(R.styleable.TextInputLayoutPlus_error);
            typedArray.recycle();
        }
//        if (ValidationUtils.isEmpty(font) || "null".equals(font)) {
//            font = ctx.getString(R.string.font_Roboto_Regular);
//        }

        setFont(ctx, font);
//        setError(error);
    }

    public void setFont(Context ctx, String font) {
        try {
            setTypeface(Utils.get(font, ctx));
        } catch (Exception ex) {
            Log.v(TextViewPlus.class.getName(), ex.toString());
        }
    }

    @Override
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        super.addView(child, index, params);
        if (child instanceof EditText) {
            setErrorEnabled(false);
            ((EditText) child).addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {

                }

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    if (getEditText().getText().length() == 0) {
                        setErrorEnabled(true);
                        setError(error);
                    } else {
                        setErrorEnabled(false);
                    }
                }

                @Override
                public void afterTextChanged(Editable s) {

                }
            });
            ((EditText) child).setOnFocusChangeListener(new OnFocusChangeListener() {
                @Override
                public void onFocusChange(View v, boolean hasFocus) {
                    if (!hasFocus || ((EditText) v).getText().length() != 0) {
                        setErrorEnabled(false);
                    } else {
                        setErrorEnabled(true);
                        setError(error);
                    }
                }
            });
        }
    }
}
