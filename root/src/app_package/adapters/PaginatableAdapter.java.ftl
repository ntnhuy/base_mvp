package ${packageName}.adapters;

import android.content.Context;
import android.support.annotation.CallSuper;
import android.support.v7.widget.RecyclerView;
import android.view.View;

import java.util.List;

/**
 * User: ntnhuy
 * Date: ${.now?string('M/dd/yy')}
 * Time: ${.now?string('h:mm a')}
 */
 
public abstract class PaginatableAdapter<Type> extends BaseAdapter<Type> {

    public static final int DEFAULT_LOAD_OFFSET = 10;
    public static final int INVALID_LOAD_OFFSET = -1;

    protected boolean mHasMoreItems = true;
    protected PaginatableAdapterListener mPaginatableAdapterListener;
    private View mView;
    private int mLoadOffset = -1;

    public PaginatableAdapter(View view, PaginatableAdapterListener adapterListener) {
        mView = view;
        mPaginatableAdapterListener = adapterListener;
    }

    public int getLoadOffset() {

        if (mLoadOffset <= INVALID_LOAD_OFFSET) {
            return DEFAULT_LOAD_OFFSET;
        }

        return mLoadOffset;
    }

    public void setLoadOffset(int loadOffset){
        mLoadOffset = loadOffset;
    }

    private static final int CIRCLE_BG_LIGHT = 0xFFFAFAFA;

    @Override
    @CallSuper
    public void onBindViewHolder(RecyclerView.ViewHolder holder, int position) {
        if (position > arrData.size() - getLoadOffset() / 2 && !mIsLoading && mHasMoreItems && mPaginatableAdapterListener != null) {
            mPaginatableAdapterListener.onLoadMore(mView);
            mIsLoading = true;
        }
    }

    public void addItems(List<Type> data, boolean hasMoreItems) {
        mHasMoreItems = hasMoreItems;
        if (data.size() < getLoadOffset()) {
            mHasMoreItems = false;
        }
        super.addItems(data);
    }

    public Context getContext() {
        return mView.getContext();
    }

    public interface PaginatableAdapterListener {
        void onLoadMore(View view);
    }
}
