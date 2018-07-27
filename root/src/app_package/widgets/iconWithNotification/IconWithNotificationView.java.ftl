package ${packageName}.widgets.iconWithNotification;

import android.graphics.drawable.Drawable;

import ${packageName}.app.bases.MvpView;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
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
