package ${packageName}.widgets.iconWithNotification;

import android.content.res.TypedArray;
import android.graphics.Color;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.Gravity;

import ${packageName}.R;
import ${packageName}.app.bases.BasePresenter;
import ${packageName}.datas.DataManager;
<#if includeDB || includeRetrofit>
import ${packageName}.datas.rx.SchedulerProvider;
import io.reactivex.disposables.CompositeDisposable;
</#if>

import javax.inject.Inject;

/**
 * Created by tohuy on 9/14/17.
 */

public class IconWithNotificationPresenter extends BasePresenter<IconWithNotificationView> {

    @Inject
    public IconWithNotificationPresenter(DataManager dataManager<#if includeDB || includeRetrofit>, SchedulerProvider schedulerProvider, CompositeDisposable compositeDisposable</#if>) {
        super(dataManager<#if includeDB || includeRetrofit>, schedulerProvider, compositeDisposable</#if>);
    }

    public void setAttributes(AttributeSet attrs) {
        if (attrs != null) {
            TypedArray typedArray = getMvpView().getContext().obtainStyledAttributes(attrs, R.styleable.IconWithNotification);
            getMvpView().setFont(typedArray.getString(R.styleable.IconWithNotification_font));
            getMvpView().setWidthIcon(typedArray.getDimensionPixelSize(R.styleable.IconWithNotification_widthIcon, -2));
            getMvpView().setHeightIcon(typedArray.getDimensionPixelSize(R.styleable.IconWithNotification_heightIcon, -2));
            getMvpView().setWidthText(typedArray.getDimensionPixelSize(R.styleable.IconWithNotification_widthText, -2));
            getMvpView().setHeightText(typedArray.getDimensionPixelSize(R.styleable.IconWithNotification_heightText, -2));
            getMvpView().setText(typedArray.getString(R.styleable.IconWithNotification_android_text));
            getMvpView().setTextAppearance(typedArray.getResourceId(R.styleable.IconWithNotification_android_textAppearance, -1));
            getMvpView().setTextAllCaps(typedArray.getBoolean(R.styleable.IconWithNotification_android_textAllCaps, false));
            getMvpView().setSrc(typedArray.getDrawable(R.styleable.IconWithNotification_android_src));
            getMvpView().setBackgroundText(typedArray.getDrawable(R.styleable.IconWithNotification_backgroundText));
            getMvpView().setTextColor(typedArray.getColor(R.styleable.IconWithNotification_android_textColor, Color.WHITE));
            getMvpView().setGravityTextView(typedArray.getInteger(R.styleable.IconWithNotification_gravityTextView, Gravity.CENTER));
            getMvpView().setPaddingTextView(typedArray.getDimensionPixelSize(R.styleable.IconWithNotification_paddingTextView, 0));
            getMvpView().setRatio(typedArray.getFloat(R.styleable.IconWithNotification_ratio_text_size, 1));
            typedArray.recycle();
        } else {
            getMvpView().setFont(getMvpView().getContext().getString(R.string.font_montserrat_regular));
            getMvpView().setWidthIcon(-2);
            getMvpView().setHeightIcon(-2);
            getMvpView().setWidthText(-2);
            getMvpView().setHeightText(-2);
            getMvpView().setBackgroundText(ContextCompat.getDrawable(getMvpView().getContext(), R.drawable.badge_circle));
            getMvpView().setTextColor(Color.WHITE);
            getMvpView().setGravityTextView(Gravity.CENTER);
        }

    }
}
