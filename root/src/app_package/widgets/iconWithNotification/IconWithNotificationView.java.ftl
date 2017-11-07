package ${packageName}.widgets.iconWithNotification;

import android.graphics.drawable.Drawable;

import ${packageName}.app.bases.MvpView;

/**
 * Created by tohuy on 9/14/17.
 */

public interface IconWithNotificationView extends MvpView {
    void setFont(String font);

    void setWidthIcon(int widthIcon);

    void setHeightIcon(int heightIcon);

    void setWidthText(int widthText);

    void setHeightText(int heightText);

    void setRatio(float ratio);

    void setText(String text);

    void setTextAppearance(int textAppearance);

    void setTextAllCaps(boolean textAllCaps);

    void setSrc(Drawable src);

    void setBackgroundText(Drawable backgroundText);

    void setDefaultTextSize(float defaultTextSize);

    void setTextColor(int textColor);

    void setGravityTextView(int gravityTextView);

    void setPaddingTextView(int paddingTextView);
}
