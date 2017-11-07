package ${packageName}.widgets.recyclerViewPlus;

import android.animation.Animator;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.content.Context;
import android.content.res.TypedArray;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;

import ${packageName}.${classApplication};
import ${packageName}.R;
import ${packageName}.app.di.component.DaggerViewComponent;
import ${packageName}.app.di.component.ViewComponent;

import javax.inject.Inject;

public class RecyclerViewPlus extends FrameLayout implements RecyclerViewPlusView {
    
    @Inject
    public RecyclerViewPlusPresenter presenter;

    private int mRecyclerViewId = -1;
    private int mLoadingStateId = -1;
    private int mEmptyStateId = -1;
    private int mErrorStateId = -1;

    private RecyclerView mRecyclerView;
    private View mLoadingStateView;
    private View mEmptyStateView;
    private View mErrorStateView;

    private AnimatorSet mFadeInAnimator;
    private AnimatorSet mFadeOutAnimator;

    private ViewComponent viewComponent;

    public RecyclerViewPlus(Context context) {
        super(context);

        init(context, null);
    }

    public RecyclerViewPlus(Context context, AttributeSet attrs) {
        super(context, attrs);

        init(context, attrs);
    }

    public RecyclerViewPlus(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);

        init(context, attrs);
    }

    private void init(Context context, AttributeSet attributeSet) {
        viewComponent = DaggerViewComponent.builder()
                .appComponent(${classApplication}.getInstance().getAppComponent())
                .build();
        viewComponent.inject(this);
        presenter.attachView(this);
        if(attributeSet != null) {
            TypedArray array = context.obtainStyledAttributes(attributeSet, R.styleable.RecyclerViewPlus);
            mRecyclerViewId = array.getResourceId(R.styleable.RecyclerViewPlus_recyclerViewId, -1);
            mLoadingStateId = array.getResourceId(R.styleable.RecyclerViewPlus_loadingStateId, -1);
            mEmptyStateId = array.getResourceId(R.styleable.RecyclerViewPlus_emptyStateId, -1);
            mErrorStateId = array.getResourceId(R.styleable.RecyclerViewPlus_errorStateId, -1);
            array.recycle();
        }
    }

    public void setErrorStateView(View v) {
        mErrorStateView = v;
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();

        presenter.onAttachedToWindow();
    }

    public void setState(RecyclerViewPlusPresenter.RecyclerViewPlusState state) {
        presenter.setState(state);
    }

    public RecyclerViewPlusPresenter.RecyclerViewPlusState getState(){
        return presenter.getState();
    }

    @Override
    public boolean findRecyclerView() {
        if(mRecyclerViewId != -1) {
            mRecyclerView = (RecyclerView) findViewById(mRecyclerViewId);
        }

        return isInEditMode() ? mRecyclerViewId != -1 : mRecyclerView != null;
    }

    @Override
    public boolean findLoadingState() {
        if(mLoadingStateId != -1) {
            mLoadingStateView = findViewById(mLoadingStateId);
        }

        return isInEditMode() ? mLoadingStateId != -1 : mLoadingStateView != null;
    }

    @Override
    public boolean findEmptyState() {
        if(mEmptyStateId != -1) {
            mEmptyStateView = findViewById(mEmptyStateId);
        }

        return isInEditMode() ? mEmptyStateId != -1 : mEmptyStateView != null;
    }

    @Override
    public boolean findErrorState() {
        if(mErrorStateId != -1) {
            mErrorStateView = findViewById(mErrorStateId);
        }

        return isInEditMode() ? mErrorStateId != -1 : mErrorStateView != null;
    }

    @Override
    public void showContentState() {
        if(mRecyclerView != null) {
            mRecyclerView.setVisibility(VISIBLE);
            mRecyclerView.setAlpha(1.0f);
        }
    }

    @Override
    public void showContentStateAnimated() {
        if(mRecyclerView != null) {
            fadeInView(mRecyclerView);
        }
    }

    @Override
    public void hideContentState() {
        if(mRecyclerView != null) {
            mRecyclerView.setVisibility(GONE);
            mRecyclerView.setAlpha(0.0f);
        }
    }

    @Override
    public void hideContentStateAnimated() {
        if(mRecyclerView != null) {
            fadeOutView(mRecyclerView);
        }
    }

    @Override
    public void showLoadingState() {
        if(mLoadingStateView != null) {
            mLoadingStateView.setVisibility(VISIBLE);
            mLoadingStateView.setAlpha(1.0f);
        }
    }

    @Override
    public void showLoadingStateAnimated() {
        if(mLoadingStateView != null) {
            fadeInView(mLoadingStateView);
        }
    }

    @Override
    public void hideLoadingState() {
        if(mLoadingStateView != null) {
            mLoadingStateView.setVisibility(GONE);
            mLoadingStateView.setAlpha(0.0f);
        }
    }

    @Override
    public void hideLoadingStateAnimated() {
        if(mLoadingStateView != null) {
            fadeOutView(mLoadingStateView);
        }
    }

    @Override
    public void showEmptyState() {
        if(mEmptyStateView != null) {
            mEmptyStateView.setVisibility(VISIBLE);
            mEmptyStateView.setAlpha(1.0f);
        }
    }

    @Override
    public void showEmptyStateAnimated() {
        if(mEmptyStateView != null) {
            fadeInView(mEmptyStateView);
        }
    }

    @Override
    public void hideEmptyState() {
        if(mEmptyStateView != null) {
            mEmptyStateView.setVisibility(GONE);
            mEmptyStateView.setAlpha(0.0f);
        }
    }

    @Override
    public void hideEmptyStateAnimated() {
        if(mEmptyStateView != null) {
            fadeOutView(mEmptyStateView);
        }
    }

    @Override
    public void showErrorState() {
        if(mErrorStateView != null) {
            mErrorStateView.setVisibility(VISIBLE);
            mErrorStateView.setAlpha(1.0f);
        }
    }

    @Override
    public void showErrorStateAnimated() {
        if(mErrorStateView != null) {
            fadeInView(mErrorStateView);
        }
    }

    @Override
    public void hideErrorState() {
        if(mErrorStateView != null) {
            mErrorStateView.setVisibility(GONE);
            mErrorStateView.setAlpha(0.0f);
        }
    }

    @Override
    public void hideErrorStateAnimated() {
        if(mErrorStateView != null) {
            fadeOutView(mErrorStateView);
        }
    }

    private void fadeInView(@NonNull View view) {
        if(mFadeInAnimator != null) {
            mFadeInAnimator.cancel();
            mFadeInAnimator = null;
        }

        view.setAlpha(0.0f);
        view.setVisibility(VISIBLE);

        mFadeInAnimator = (AnimatorSet)AnimatorInflater.loadAnimator(getContext(), R.animator.content_fade_in);
        mFadeInAnimator.setTarget(view);
        mFadeInAnimator.start();
    }

    private void fadeOutView(@NonNull final View view) {
        if(mFadeOutAnimator != null) {
            mFadeOutAnimator.cancel();
            mFadeOutAnimator = null;
        }

        view.setAlpha(1.0f);
        view.setVisibility(VISIBLE);

        mFadeOutAnimator = (AnimatorSet)AnimatorInflater.loadAnimator(getContext(), R.animator.content_fade_out);
        mFadeOutAnimator.setTarget(view);
        mFadeOutAnimator.addListener(new Animator.AnimatorListener() {
            @Override
            public void onAnimationStart(Animator animation) {}

            @Override
            public void onAnimationEnd(Animator animation) {
                mFadeOutAnimator = null;
                view.setVisibility(GONE);
            }

            @Override
            public void onAnimationCancel(Animator animation) {
                mFadeOutAnimator = null;
            }

            @Override
            public void onAnimationRepeat(Animator animation) {}
        });
        mFadeOutAnimator.start();
    }

    @Override
    public void resetView() {

    }

    public void setLayoutManager(RecyclerView.LayoutManager layoutManager) {
        if (mRecyclerView != null) {
            mRecyclerView.setLayoutManager(layoutManager);
        }
    }

    public void setAdapter(RecyclerView.Adapter adapter) {
        if (mRecyclerView != null) {
            mRecyclerView.setAdapter(adapter);
        }
    }

    public void addItemDecoration(RecyclerView.ItemDecoration itemDecoration) {
        if (mRecyclerView != null) {
            mRecyclerView.addItemDecoration(itemDecoration);
        }
    }

    public void setItemAnimator(RecyclerView.ItemAnimator itemAnimator) {
        if (mRecyclerView != null) {
            mRecyclerView.setItemAnimator(itemAnimator);
        }
    }
}
