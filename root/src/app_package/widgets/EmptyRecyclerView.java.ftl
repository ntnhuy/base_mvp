package ${packageName}.widgets;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.View;

public class EmptyRecyclerView extends RecyclerView {

    @Nullable
    private View emptyView;
    public int emptyCount = 0;
    private EmptyViewListener listener;

    public EmptyRecyclerView(Context context) {
        super(context);
    }

    public EmptyRecyclerView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public EmptyRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override
    public void setAdapter(@Nullable Adapter adapter) {
        final Adapter oldAdapter = getAdapter();
        if (oldAdapter != null) {
            oldAdapter.unregisterAdapterDataObserver(observer);
        }
        if (adapter != null) {
            adapter.registerAdapterDataObserver(observer);
        }
        super.setAdapter(adapter);
        checkIfEmpty();
    }

    @NonNull
    private final AdapterDataObserver observer = new AdapterDataObserver() {
        @Override
        public void onChanged() {
            super.onChanged();
            checkIfEmpty();
        }

        @Override
        public void onItemRangeInserted(int positionStart, int itemCount) {
            super.onItemRangeInserted(positionStart, itemCount);
            checkIfEmpty();
        }

        @Override
        public void onItemRangeRemoved(int positionStart, int itemCount) {
            super.onItemRangeRemoved(positionStart, itemCount);
            checkIfEmpty();
        }
    };

    /**
     * Indicates the view to be shown when the adapter for this object is empty
     *
     * @param emptyView
     */
    public void setEmptyView(@Nullable View emptyView) {
        if (this.emptyView != null) {
            this.emptyView.setVisibility(GONE);
        }
        this.emptyView = emptyView;
        checkIfEmpty();
    }

    /**
     * Check adapter item count and toggle visibility of empty view if the adapter is empty
     */
    private void checkIfEmpty() {
        if (emptyView != null && getAdapter() != null) {
            if (getAdapter().getItemCount() > emptyCount) {
                emptyView.setVisibility(GONE);
                if (listener != null) {
                    listener.onEmptyView(false);
                }
            } else {
                emptyView.setVisibility(VISIBLE);
                if (listener != null) {
                    listener.onEmptyView(true);
                }
            }
        }
    }

    public EmptyViewListener getListener() {
        return listener;
    }

    public void setListener(EmptyViewListener listener) {
        this.listener = listener;
    }

    public interface EmptyViewListener {
        void onEmptyView(boolean isEmpty);
    }
}